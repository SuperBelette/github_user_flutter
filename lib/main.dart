import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:githubuserflutter/api/api.dart';
import 'package:githubuserflutter/details.dart';
import 'package:githubuserflutter/favorites.dart';
import 'package:githubuserflutter/models/favorites.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Favorites(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users;

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
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 3,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(users.length, (index) {
          return FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetails(user: users[index]),
              ),
              );
            },
            child: Expanded(
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
            ),
          );
        }),
      ),
    );
  }


}
