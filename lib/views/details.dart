

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubuserflutter/models/favorites.dart';
import 'package:githubuserflutter/models/user.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatelessWidget{
  final User user;

  const UserDetails({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(user.login),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey.shade700,
              backgroundImage: NetworkImage(user.avatarUrl),
              radius: 90,
            ),

            FavoriteCard(user: user)
          ],
        ),
      ),
    );
  }

}

class FavoriteCard extends StatefulWidget{
  final User user;

  const FavoriteCard({Key key, this.user}) : super(key: key);

  _FavoriteCardState createState() => _FavoriteCardState();

}

class _FavoriteCardState extends State<FavoriteCard>{

  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<Favorites>(context);

    String text = '';
    if(favorites.contains(widget.user)){
      text = 'delete from favorite';
    }
    else {
      text = 'add to favorites';
    }

    return FlatButton(
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
          )),
    );
  }

}