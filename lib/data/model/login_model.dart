import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state_model.dart';
import 'package:redux_sign_in/data/model/login_model.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

enum STATUS { SUCCESS, FAIL, LOADING, NETWORK_ERROR }

class UserLogin {
  String username;
  String password;
  bool isLogin = false;
  STATUS status;

  UserLogin({this.username, this.password, this.isLogin, this.status});

  static fromJson(json) {
    return UserLogin(username: json['username'], password: json['password']);
  }

  UserLogin copyWith(
      {String username, String password, bool isLogin, STATUS status}) {
    return UserLogin(
        username: username ?? this.username,
        password: password ?? this.password,
        isLogin: isLogin ?? this.isLogin,
        status: status ?? this.status);
  }

  @override
  String toString() {
    return 'UserLogin{username: $username, password: $password, isLogin: $isLogin}';
  }
}
