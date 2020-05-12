import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubuserflutter/notifiers/favorites_notifier.dart';
import 'package:provider/provider.dart';

import 'details.dart';

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<FavoritesNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('favorites'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(favorites.getLenght(), (index) {
          return FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetails(user: favorites.get(index)),
                ),
              );
            },
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image(
                image: NetworkImage(favorites.get(index).avatarUrl),
              ),
            ),
          );
        }),
      ),
    );
  }
}
