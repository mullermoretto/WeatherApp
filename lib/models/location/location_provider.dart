
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationProvider {
  String _city = "";


  Future<bool> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    return status.isGranted;
  }

  Future<String> getCityFromLocation() async {

    requestLocationPermission();

    try {
      Position position = await Geolocator.getCurrentPosition();

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      _city = placemarks.first.subAdministrativeArea ?? "";

      return _city;
    } catch (e) {
      print('Erro ao obter a cidade: $e');
      return "";
    }
  }

  void getActualCity() async {

    await getCityFromLocation();
    if (_city != null) {
      print('Cidade atual: $_city');
    } else {
      print('Não foi possível obter a cidade.');
    }
  }
  
}