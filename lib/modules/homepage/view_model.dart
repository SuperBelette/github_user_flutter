import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:githubuserflutter/api/api.dart';
import 'package:githubuserflutter/models/theme.dart';
import 'package:githubuserflutter/models/user.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({this.api, this.theme});

  List<User> users = [];
  Api api;
  ThemeNotifier theme;
  bool themeBrightnessLight = true;

  Future<void> getUsers() async {
    final response = await api.getUsers();

    try {
      if (response.statusCode == 403) {
        print(response.reasonPhrase);
      } else {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  void changeBrightness(){
    if (themeBrightnessLight){
      ThemeData themeData = ThemeData(
        brightness: Brightness.dark
      );

      theme.setTheme(themeData);
      themeBrightnessLight = false;
    }
    else {
      ThemeData themeData = ThemeData(
          brightness: Brightness.dark
      );

      theme.setTheme(themeData);
      themeBrightnessLight = true;
    }
  }
}
