import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationProvider extends ChangeNotifier {
  LocationProvider({required this.location});
  Location location;
  bool _isPermissionGranted = false;
  bool get isPermissionGranted => _isPermissionGranted;

  bool _isCheckingPermission = true;
  bool get isCheckingPermission => _isCheckingPermission;

  Future<void> checkPermission() async {
    _isCheckingPermission = true;
    notifyListeners();

    bool _serviceEnabled;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    requestPermission().then((value) {
      _isPermissionGranted = value;
      _isCheckingPermission = false;
      notifyListeners();
    });
  }

  Future<bool> requestPermission() async {
    PermissionStatus _permissionGranted;
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
      return true;
    }
    return true;
  }

  Future<LocationData?> getLocation() async {
    if (_isPermissionGranted == true) {
      return location.getLocation();
    }
    return null;
  }
}
