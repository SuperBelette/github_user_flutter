import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:githubuserflutter/api/api.dart';
import 'package:githubuserflutter/models/user.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({this.api});

  List<dynamic> users = [];
  Api api;

  Future<void> getUsers() async {
    try {
      final response = await api.getUsers();
      if (response.statusCode == 403) {
        print(response.reasonPhrase);
      } else {
        final List<dynamic> list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
