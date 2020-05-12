
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:githubuserflutter/models/user.dart';

class Favorites extends ChangeNotifier {
  final List<User> _users = [];

  UnmodifiableListView<User> get items => UnmodifiableListView(_users);

  void add(User user){
    _users.add(user);
    notifyListeners();
  }

  void removeall(){
    _users.clear();
    notifyListeners();
  }
}