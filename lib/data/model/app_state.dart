import 'package:flutter/material.dart';
import 'package:redux_sign_in/data/model/campaign.dart';
import 'package:redux_sign_in/data/model/shop_item.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/data/model/user_register.dart';
import 'package:redux_sign_in/util/sharedpref_util.dart';

class AppState {
  UserRegister userRegister;
  UserLogin user_info;
  Campaign campaign;
  int code;
  List<ShopItem>shopItems;

  AppState.initialState()
      : user_info = UserLogin(),
        userRegister = UserRegister(),
        campaign = Campaign(),shopItems=new List<ShopItem>();

  AppState({this.userRegister, this.user_info, this.code, this.campaign,this.shopItems});

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
