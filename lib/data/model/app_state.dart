import 'package:flutter/material.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/data/model/user_register.dart';

class AppState {
  UserRegister userRegister;
  UserLogin userLogin;
  bool isLoading;
  AppState.initialState() : userLogin = new UserLogin(username: "konul", password: "aaa");

  AppState({this.userRegister, this.userLogin, this.isLoading});


}
