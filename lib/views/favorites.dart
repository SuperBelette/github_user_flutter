
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorites.dart';

class FavoritesView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<Favorites>(context);

    return Scaffold(
      backgroundColor: Colors.green,
      body: GridView.count(
          crossAxisCount: 3,
        children: List.generate(favorites.getLenght(), (index) {
          return Image.network(favorites.get(index).avatarUrl);
        }),
      ),
    );
  }

}