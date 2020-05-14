
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubuserflutter/models/favorites.dart';
import 'package:githubuserflutter/modules/details/view.dart';
import 'package:githubuserflutter/modules/favorites/view_model.dart';
import 'package:provider/provider.dart';

class FavoriteView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritesViewModel(favorites: Provider.of<FavoritesNotifier>(context)),
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

    return Scaffold(
      appBar: AppBar(
        title: Text('favorites'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(_viewModel.favorites.getLenght() ?? 0, (index) {
          return FlatButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => DetailsView(user: _viewModel.favorites.get(index)),
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
                image: CachedNetworkImageProvider(_viewModel.favorites.get(index).avatarUrl),
              ),
            ),
          );
        }),
      ),
    );
  }



}