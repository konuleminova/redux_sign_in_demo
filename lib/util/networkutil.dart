import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/redux/middleware/thunk_login.dart';

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
      print(response.statusCode.toString()+"..");
        if (response.statusCode == 200) {
          return AppState.fromJson(json.decode(response.body));
        }
        else{
        return null;
        }
    } catch (exception) {
       {
        return null;
      }
    }
  }
}
