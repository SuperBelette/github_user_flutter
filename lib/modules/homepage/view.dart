import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubuserflutter/modules/details/view.dart';
import 'package:githubuserflutter/modules/homepage/view_model.dart';
import 'package:githubuserflutter/views/favorites.dart';
import 'package:provider/provider.dart';



class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: _View(),
    );
  }
}

class _View extends StatefulWidget {
  const _View({Key key,}) : super(key: key);

  @override
  __ViewState createState() => __ViewState();
}

class __ViewState extends State<_View> {
  HomeViewModel _viewModel;


  @override
  Widget build(BuildContext context) {
    final _viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Github Users"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoritesView(),
              ),
            ),
          ),
        ],
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 3,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(_viewModel.users.length, (index) {
          return FlatButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(
                    user: _viewModel.users[index],
                  ),
                ),
              );
            },
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImage(
                imageUrl: _viewModel.users[index].avatarUrl,
              ),
            ),
          );
        }),
      ),
    );
  }
}


