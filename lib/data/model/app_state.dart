import 'package:flutter/material.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/data/model/user_register.dart';

class AppState {
  UserRegister userRegister;
  UserLogin userLogin;
  bool isLogin=false;

  AppState.initialState() {
    isLogin:false;
  }

  AppState({this.userRegister, this.userLogin, this.isLogin});
}
