

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier{
  ThemeData themeData = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  void setTheme(ThemeData themeData){
    this.themeData = themeData;
    notifyListeners();
  }

  ThemeData getTheme(){
    return themeData;
  }

}