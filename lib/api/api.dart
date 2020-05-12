import 'package:http/http.dart' as http;

class Api {
  final String baseUrl = 'api.github.com';

  Future getUsers(){
    var queryParameters = {
      'since': '0'
    };

    var uri =
    Uri.https(baseUrl, '/users', queryParameters);

    return http.get(uri);
  }
}