
import 'package:flutter/cupertino.dart';
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}