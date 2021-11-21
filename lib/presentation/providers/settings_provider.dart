import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool _useCelcius = true;
  bool get useCelcius => _useCelcius;

  void setTempModeToCelcius(bool value) {
    _useCelcius = value;
    notifyListeners();
  }
}
