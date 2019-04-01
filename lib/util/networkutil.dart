import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:redux_sign_in/redux/middleware/thunkfunction.dart';

class NetworkUtils {
  static final String BASE_URL = "http://35.240.80.11/app/";
  static String LOGIN_ENDPOINT = "login/";

  static dynamic loginUser(String username, String password)async {
    var uri = BASE_URL + LOGIN_ENDPOINT;
    try {
      final response = await http.post(uri,
          body: json.encode({
            'username': username,
            'password': password,
          }),
          headers: {"Accept": "application/json"});
        if (response.statusCode == 200) {
          return response.body;
        }
    } catch (exception) {
      if(exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }
}
