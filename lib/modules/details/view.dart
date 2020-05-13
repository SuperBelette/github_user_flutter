
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubuserflutter/modules/details/view_model.dart';
import 'package:provider/provider.dart';

import '../../models/favorites.dart';
import '../../models/user.dart';

class Details extends StatelessWidget{
  final User user;

  const Details({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailsViewModel(),
      child: _View(user: user),
    );
  }
}

class _View extends StatefulWidget{
  final User user;

  const _View({Key key, this.user}) : super(key: key);

  @override
  __ViewState createState() => __ViewState();
}

class __ViewState extends State<_View>{
  DetailsViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    final _viewModel = context.watch<DetailsViewModel>();

    var favorites = Provider.of<Favorites>(context);

    String text = '';
    if(favorites.contains(widget.user)){
      text = 'delete from favorite';
    }
    else {
      text = 'add to favorites';
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(widget.user.login),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey.shade700,
              backgroundImage: NetworkImage(widget.user.avatarUrl),
              radius: 90,
            ),

            FlatButton(
              onPressed: () {
                if(favorites.contains(widget.user)){
                  favorites.remove(widget.user);
                }
                else {
                  favorites.add(widget.user);
                }
              },
              child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.add,
                      color: Colors.teal,
                    ),
                    title: Text(
                      text,
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


