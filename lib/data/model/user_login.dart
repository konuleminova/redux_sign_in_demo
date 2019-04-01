import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

enum STATUS { SUCCESS, FAIL, LOADING,NETWORK_ERROR }

class UserLogin {
  String username;
  String password;
  bool isLogin = false;
  STATUS status;

  UserLogin({this.username, this.password, this.isLogin, this.status});

  static fromJson(json) {
    return UserLogin(username: json['username'], password: json['password']);
  }

  @override
  String toString() {
    return 'UserLogin{username: $username, password: $password, isLogin: $isLogin}';
  }
}
