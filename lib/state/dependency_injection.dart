import 'package:get/get.dart';
import 'package:weather_app/state/location_check.dart';

class DependenciesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationChecker());
  }
}
