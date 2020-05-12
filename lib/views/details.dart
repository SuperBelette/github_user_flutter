

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubuserflutter/models/favorites.dart';
import 'package:githubuserflutter/models/user.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatelessWidget{
  final User user;

  const UserDetails({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<Favorites>(context);


    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(user.login),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey.shade700,
              backgroundImage: NetworkImage(user.avatarUrl),
              radius: 90,
            ),
            FlatButton(
              onPressed: () { favorites.add(user); },
              child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.add,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'add to favorites',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 20.0,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

}