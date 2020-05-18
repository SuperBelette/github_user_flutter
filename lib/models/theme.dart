import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  void setTheme(ThemeData themeData) {
    this._themeData = themeData;
    notifyListeners();
  }

  ThemeData getTheme() {
    return _themeData;
  }
}
