import 'package:http/http.dart' as http;

class Api {
  final String baseUrl = 'api.github.com';

  Future<http.Response> getUsers() async {
    var queryParameters = {
      'since': '0'
    };

    var uri =
    Uri.https(baseUrl, '/users', queryParameters);

    http.Response response;

    try {
      response = await http.get(uri);

    }
    catch (error){
      String errorMessage = ' unable to get response from '  + baseUrl + ' error: ' + error;
      print (errorMessage);
    }

    return response;
  }
}