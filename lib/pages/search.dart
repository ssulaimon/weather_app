import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/logics/search_location_weather.dart';
import 'package:weather_app/model/current_weather_model.dart';
import 'package:weather_app/state/location_check.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var weather = Get.find<LocationChecker>();
    String? location;
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/sunny_day.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              children: [
                TextField(
                  onSubmitted: (text) async {
                    if (text.isNotEmpty) {
                      location = text;
                      CurrentLocationWeatherData? currentLocationWeatherData =
                          await SearchLocationWeather.searchLocationweather(
                        location: text,
                      );
                      if (currentLocationWeatherData != null) {
                        weather.updateSearchKeyWord(text);
                        weather.updateSearchResult(currentLocationWeatherData);
                      }
                    } else {}
                  },
                  decoration: InputDecoration(
                    fillColor: const Color(0xFF64AFB1),
                    filled: true,
                    hintText: 'Search Location Weather',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        )),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                Obx(() => weather.currentLocationWeatherData.value != null
                    ? Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF64AFB1),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  weather.searchKeyWord.string,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Image.network(
                                    'http:${weather.currentLocationWeatherData.value!.iconImage}'),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      weather.currentLocationWeatherData.value!
                                          .tmepC
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Text(
                                      'o',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      weather.currentLocationWeatherData.value!
                                          .tempF
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Text(
                                      'F',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              weather
                                  .currentLocationWeatherData.value!.condition,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              weather.currentLocationWeatherData.value!.date.day
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
