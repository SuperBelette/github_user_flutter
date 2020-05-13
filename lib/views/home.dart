
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubuserflutter/api/api.dart';
import 'package:githubuserflutter/models/user.dart';
import 'package:githubuserflutter/modules/details/view.dart';

import 'favorites.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  _getUsers() {
    Api().getUsers().then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Users"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesView())))

        ],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(users.length, (index) {
          return FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Details(user: users[index]),
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
                image: NetworkImage(users[index].avatarUrl),
              ),
            ),
          );
        }),
      ),
    );
  }
}
