import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubuserflutter/api/api.dart';
import 'package:githubuserflutter/modules/details/view.dart';
import 'package:githubuserflutter/modules/favorites/view.dart';
import 'package:githubuserflutter/modules/homepage/view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<Api, HomeViewModel>(
      create: (context) => HomeViewModel(),
      update: (_, api, viewmodel) => viewmodel..api = api,
      child: _View(),
    );
  }
}

class _View extends StatefulWidget {
  const _View({
    Key key,
  }) : super(key: key);

  @override
  __ViewState createState() => __ViewState();
}

class __ViewState extends State<_View> {
  HomeViewModel _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final _viewModel = context.read<HomeViewModel>();
    if (_viewModel != this._viewModel) {
      this._viewModel = _viewModel;
      _viewModel.getUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Users"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Favorite(),
              ),
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(_viewModel?.users?.length ?? 0, (index) {
          return FlatButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(
                    user: _viewModel?.users[index],
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
                imageUrl: _viewModel?.users[index].avatarUrl,
              ),
            ),
          );
        }),
      ),
    );
  }
}
