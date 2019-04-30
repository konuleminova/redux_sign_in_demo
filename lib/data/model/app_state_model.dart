import 'package:flutter/material.dart';
import 'package:redux_sign_in/data/model/home_model.dart';
import 'package:redux_sign_in/data/model/shop_model.dart';
import 'package:redux_sign_in/data/model/login_model.dart';
import 'package:redux_sign_in/data/model/register_model.dart';
import 'package:redux_sign_in/util/sharedpref_util.dart';

class AppState {
  UserRegister userRegister;
  UserLogin user_info;
  Home home;
  int code;
  List<ShopItem>shopItems;

  AppState.initialState()
      : user_info = UserLogin(),
        userRegister = UserRegister(),
        home = Home(),shopItems=new List<ShopItem>();

  AppState({this.userRegister, this.user_info, this.code, this.home,this.shopItems});

  static AppState fromJson(dynamic json) {
    if (json != null) {
      return AppState(
          user_info: UserLogin.fromJson(json['user_info']), code: json['code']);
    }
  }

  @override
  String toString() {
    return 'AppState{userRegister: $userRegister, userLogin: $user_info}';
  }
}
