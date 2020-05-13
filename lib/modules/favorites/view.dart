
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubuserflutter/models/favorites.dart';
import 'package:githubuserflutter/modules/details/view.dart';
import 'package:githubuserflutter/modules/favorites/view_model.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritesViewModel(),
      child: _View(),
    );
  }
  
}

class _View extends StatefulWidget{
  const _View({Key key,}) : super(key: key);

  @override
  __ViewState createState() => __ViewState();
}

class __ViewState extends State<_View> {
  FavoritesViewModel _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final _viewModel = context.read<FavoritesViewModel>();
    if (_viewModel != this._viewModel) {
      this._viewModel = _viewModel;
    }

  }

  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<Favorites>(context);

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
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Details(user: favorites.get(index)),
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