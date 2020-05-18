import 'package:flutter/material.dart';
import 'package:githubuserflutter/api/api.dart';
import 'package:githubuserflutter/models/favorites.dart';
import 'package:githubuserflutter/models/theme.dart';
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
        ChangeNotifierProvider(
          create: (context) => FavoritesNotifier(),
        ),
        Provider<Api>(
          create: (context) => Api(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeNotifier(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomeView(),
      ),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData.getTheme(),
      home: HomeView(),
    );
  }
}
