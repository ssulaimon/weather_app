import 'dart:convert';

import 'package:weather_app/const/api_end_point.dart';
import 'package:weather_app/const/api_key.dart';
import 'package:weather_app/model/location_model.dart';
import 'package:http/http.dart';
import 'dart:developer';

class CurrentLocationWeather {
  static Future<Map<String, dynamic>?> currentLocationWeather({
    required LocationModel locationModel,
  }) async {
    var url = Uri.parse(
      "${ApiEndPoint.baseUrl}forecast.json?key=${ApiKey.apiKey}&q=${locationModel.latitude.toString()},${locationModel.longitude.toString()}&days=10&aqi=no&alerts=no",
    );
    Response response = await get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = await jsonDecode(response.body);
      return body;
    } else {
      log(response.statusCode.toString());
      return null;
    }
  }
}
