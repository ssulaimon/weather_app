import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/pages/search.dart';
import 'package:weather_app/state/location_check.dart';
import 'package:weather_app/widgets/forcaste_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<LocationChecker>(builder: (weather) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              DropdownButton<String>(
                  dropdownColor: Colors.transparent,
                  value: weather.meausermentChoice.string,
                  items: const [
                    DropdownMenuItem(
                      value: 'C',
                      child: Text(
                        'C',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'F',
                      child: Text(
                        'F',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                  onChanged: (value) {
                    weather.updateMeansurementChoice(value!);
                  }),
              IconButton(
                onPressed: () => Get.to(() => const SearchScreen()),
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            ],
          ),
          body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/sunny_day.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    weather.apiResponseLocationData!.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    weather.apiResponseLocationData!.region,
                    style: const TextStyle(color: Colors.white),
                  ),
                  weather.meausermentChoice.string == "C"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weather.currentLocationWeather!.tmepC.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "o",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weather.currentLocationWeather!.tempF.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "F",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                  Text(
                    weather.currentLocationWeather!.condition,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: const Color(0xFFC7D4D3).withOpacity(0.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Weather Forecast",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Saved Locations",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 2.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 170,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ForecastWidget(
                                day: weather.foreCast![index].date.day
                                    .toString(),
                                icon: weather.foreCast![index].iconImage,
                                temp: weather.meausermentChoice.string == 'F'
                                    ? weather.foreCast![index].tempF.toString()
                                    : weather.foreCast![index].tmepC.toString(),
                              );
                            },
                            itemCount: weather.foreCast!.length,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
