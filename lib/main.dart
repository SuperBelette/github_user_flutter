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
      child: MaterialAppWithTheme(
        title: 'Flutter Demo',
        home: HomeView(),
      ),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    Key key,
    this.title,
    this.home,
  }) : super(key: key);

  final String title;
  final Widget home;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: title,
      theme: themeData.getTheme(),
      home: home,
    );
  }
}
