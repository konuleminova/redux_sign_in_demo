import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UserLogin {
  String username;
  String password;
  bool isLogin = false;

  UserLogin({this.username, this.password});

  static fromJson(json) {
    return UserLogin(username: json['username'], password: json['password']);
  }

  @override
  String toString() {
    return 'UserLogin{username: $username, password: $password, isLogin: $isLogin}';
  }


}
