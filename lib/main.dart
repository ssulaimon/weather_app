import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/pages/splash_screen.dart';
import 'package:weather_app/state/dependency_injection.dart';

void main() {
  runApp(GetMaterialApp(
    home: const SplashScreen(),
    initialBinding: DependenciesBinding(),
  ));
}
