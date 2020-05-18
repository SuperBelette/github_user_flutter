import 'package:flutter/cupertino.dart';
import 'package:githubuserflutter/models/favorites.dart';
import 'package:githubuserflutter/models/user.dart';

class DetailsViewModel extends ChangeNotifier {
  DetailsViewModel({
    this.favorites,
    this.user,
  });

  User user;
  FavoritesNotifier favorites;

  String getButtonText() {
    if (favorites.contains(user)) {
      return 'delete from favorite';
    } else {
      return 'add to favorites';
    }
  }

  void buttonPressed() {
    if (favorites.contains(user)) {
      favorites.remove(user);
    } else {
      favorites.add(user);
    }

    notifyListeners();
  }
}
