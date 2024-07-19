import 'package:location/location.dart';

class LocationService {
  Location location = Location();
  Future<void> checkAndRequestLocationService() async {
    // Inquire About Location Service Enabled?
    var isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      var isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        throw LocationServiceException();
      }
    }
  }

  Future<void> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      throw LocationPerimissionException();
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        throw LocationPerimissionException();
      } else {}
    }
  }

  void getRealTimeLocation(Function(LocationData)? onData) {
    location.onLocationChanged.listen(onData);
  }

  Future<LocationData> getLocationData() async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    return await location.getLocation();
  }
}

class LocationServiceException implements Exception {}

class LocationPerimissionException implements Exception {}


// check and Request google maps services
// check and Request google maps permissions
// get real time location
// get current location