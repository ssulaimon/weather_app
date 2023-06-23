import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/state/location_check.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<LocationChecker>();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'images/splash_image.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
