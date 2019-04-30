import 'package:flutter/material.dart';
import 'package:redux_sign_in/data/model/home_model.dart';
import 'package:redux_sign_in/data/model/shop_model.dart';
import 'package:redux_sign_in/data/model/login_model.dart';

class AppState {
  UserLogin user_info;
  Home home;
  int code;
  List<ShopItem>shopItems;

  AppState.initialState()
      : user_info = UserLogin(),
        home = Home(),shopItems=new List<ShopItem>();

  AppState({this.user_info, this.code, this.home,this.shopItems});

  static AppState fromJson(dynamic json) {
    if (json != null) {
      return AppState(
          user_info: UserLogin.fromJson(json['user_info']), code: json['code']);
    }
  }

  @override
  String toString() {
    return 'AppState{ userLogin: $user_info}';
  }
}
