// ignore_for_file: cast_from_null_always_fails, unnecessary_cast

import 'dart:developer';

import 'package:get/get.dart';
import 'package:weather_app/logics/current_location_weather.dart';
import 'package:weather_app/logics/user_location.dart';
import 'package:weather_app/model/current_weather_model.dart';
import 'package:weather_app/model/location_model.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/model/api_location_response.dart';

class LocationChecker extends GetxController {
  LocationModel? locationData;
  ApiResponseLocationData? apiResponseLocationData;
  CurrentLocationWeatherData? currentLocationWeather;
  List<CurrentLocationWeatherData>? foreCast;
  RxString meausermentChoice = 'C'.obs;
  RxString searchKeyWord = ''.obs;

  Rx<CurrentLocationWeatherData?> currentLocationWeatherData =
      (null as CurrentLocationWeatherData?).obs;

  void getLocation() async {
    locationData = await UserLocation.userLocation() ??
        LocationModel(
          latitude: 7.376736,
          longitude: 3.939786,
        );
    Map<String, dynamic>? data =
        await CurrentLocationWeather.currentLocationWeather(
            locationModel: locationData!);
    if (data != null) {
      apiResponseLocationData =
          ApiResponseLocationData.fromJson(json: data['location']);
      currentLocationWeather = CurrentLocationWeatherData.fromJson(
        json: data['current'],
      );
      List weathers = await data['forecast']['forecastday'];
      foreCast = List.generate(
        weathers.length,
        (index) => CurrentLocationWeatherData(
            condition: weathers[index]['day']['condition']['text'],
            date: DateTime.parse(weathers[index]['date']),
            iconImage: weathers[index]['day']['condition']['icon'],
            tempF: weathers[index]['day']['maxtemp_f'],
            tmepC: weathers[index]['day']['maxtemp_c']),
      );
    }
    log(foreCast.toString());
    Get.off(const HomePage());
  }

  updateMeansurementChoice(String value) {
    meausermentChoice(value);
  }

  updateSearchKeyWord(String value) {
    searchKeyWord(value);
  }

  updateSearchResult(CurrentLocationWeatherData result) {
    currentLocationWeatherData.value = result;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }
}
