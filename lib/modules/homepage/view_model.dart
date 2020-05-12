import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:githubuserflutter/api/api.dart';
import 'package:githubuserflutter/models/user.dart';

class HomeViewModel extends ChangeNotifier {
  List<User> users = [];

  Future<void> getUsers() async {
    try {
      final response = await Api().getUsers();
      if (response.statusCode == 403) {
        print(response.reasonPhrase);
      } else {
        final list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      }
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }
}
