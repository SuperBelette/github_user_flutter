import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:githubuserflutter/models/user.dart';

class FavoritesNotifier extends ChangeNotifier {
  final List<User> _users = [];

  UnmodifiableListView<User> get items => UnmodifiableListView(_users);

  void add(User user) {
    _users.add(user);
    notifyListeners();
  }

  void removeall() {
    _users.clear();
    notifyListeners();
  }

  int getLenght() {
    return _users.length;
  }

  User get(int index) {
    return _users[index];
  }

  bool contains(User user) {
    return _users.contains(user);
  }

  void remove(User user) {
    _users.remove(user);
    notifyListeners();
  }
}
