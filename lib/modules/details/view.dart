
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubuserflutter/models/favorites.dart';
import 'package:githubuserflutter/models/user.dart';
import 'package:githubuserflutter/modules/details/view_model.dart';
import 'package:provider/provider.dart';



class DetailsView extends StatelessWidget{
  final User user;

  const DetailsView({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<FavoritesNotifier, DetailsViewModel>(
      create: (context) => DetailsViewModel(user : user),
      update: (_,favorite ,viewmodel) => DetailsViewModel(favorites: favorite, user: user),
      child: _View(),
    );
  }
}

class _View extends StatefulWidget{
  const _View({Key key}) : super(key: key);

  @override
  __ViewState createState() => __ViewState();
}

class __ViewState extends State<_View>{
  DetailsViewModel _viewModel;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final _viewModel = context.read<DetailsViewModel>();
    if (_viewModel != this._viewModel) {
      this._viewModel = _viewModel;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(_viewModel?.user?.login ?? ""),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey.shade700,
              backgroundImage: CachedNetworkImageProvider(_viewModel.user.avatarUrl),
              radius: 90,
            ),

            FlatButton(
              onPressed: () {
                _viewModel.buttonPressed();
              },
              child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.add,
                      color: Colors.teal,
                    ),
                    title: Text(
                      _viewModel.getButtonText(),
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


