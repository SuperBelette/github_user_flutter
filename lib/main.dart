
import 'package:flutter/material.dart';
import 'package:githubuserflutter/api/api.dart';
import 'package:githubuserflutter/models/favorites.dart';
import 'package:provider/provider.dart';

import 'package:githubuserflutter/modules/homepage/view.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritesNotifier(),
        ),
        Provider<Api>(create: (context) => Api(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeView(),
      ),
    );
  }
}

