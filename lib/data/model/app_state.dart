import 'package:flutter/material.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/data/model/user_register.dart';
import 'package:redux_sign_in/util/sharedpref.dart';

class AppState {
  UserRegister userRegister;
  UserLogin user_info;
  int code;

  AppState.initialState()
      : user_info = UserLogin(),
        userRegister = UserRegister();

  AppState({this.userRegister, this.user_info, this.code});
  static AppState fromJson(dynamic json){
    if(json!=null){
      return AppState(user_info: UserLogin.fromJson(json['user_info']),code: json['code']);
    }
  }

  @override
  String toString() {
    return 'AppState{userRegister: $userRegister, userLogin: $user_info}';
  }
}
