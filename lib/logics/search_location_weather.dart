import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:weather_app/model/current_weather_model.dart';

import '../const/api_end_point.dart';
import '../const/api_key.dart';

class SearchLocationWeather {
  static Future<CurrentLocationWeatherData?> searchLocationweather(
      {required String location}) async {
    var url = Uri.parse(
      "${ApiEndPoint.baseUrl}forecast.json?key=${ApiKey.apiKey}&q=$location&aqi=no",
    );
    Response response = await get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = await jsonDecode(response.body);
      CurrentLocationWeatherData currentLocationWeatherData =
          CurrentLocationWeatherData.fromJson(json: body['current']);
      return currentLocationWeatherData;
    } else {
      log(response.statusCode.toString());
      return null;
    }
  }
}
