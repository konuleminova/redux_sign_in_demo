import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/ui/page/login.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginSuccessAction {
  bool isLoginSuccess;

  LoginSuccessAction({this.isLoginSuccess});
}

ThunkAction<AppState> loginThunkAction(BuildContext context,String url, {Map body}) {
  print("thunk");
  return (Store<AppState> store) async {
    var bodyEncoded = json.encode(body);
    http.post(url,
        body: bodyEncoded,
        headers: {"Accept": "application/json"}).then((http.Response response) {
      if (response.statusCode == 200) {
        print(convert.jsonDecode(response.body));
        store.dispatch(LoginSuccessAction(isLoginSuccess: true));
        store.state.isLogin=true;
      }
    });
  };
}
