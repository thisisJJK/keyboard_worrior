import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseViewModel with ChangeNotifier {
  bool _isLightTheme = true;

  bool get isLightTheme => _isLightTheme;

  set isLightTheme(bool value) {
    _isLightTheme = value;
  }

  bool _isKor = true;

  bool get isKor => _isKor;

  set isKor(bool value) {
    _isKor = value;

    notifyListeners();
  }
}
