import 'package:location/location.dart';
import 'package:weather_app/model/location_model.dart';

class UserLocation {
  static Future<LocationModel?> userLocation() async {
    Location location = Location();
    LocationData locationData;
    PermissionStatus permissionStatus;
    bool isEnaled;

    isEnaled = await location.serviceEnabled();
    if (!isEnaled) {
      isEnaled = await location.requestService();
      if (!isEnaled) {
        return null;
      }
    }
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return null;
      }
    }
    locationData = await location.getLocation();

    LocationModel locationModel = LocationModel(
        latitude: locationData.latitude!, longitude: locationData.longitude!);
    return locationModel;
  }
}
