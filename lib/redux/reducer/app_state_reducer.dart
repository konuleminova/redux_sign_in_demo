import 'package:flutter/material.dart';
import 'package:redux_sign_in/data/model/app_state_model.dart';
import 'package:redux_sign_in/data/model/shop_model.dart';
import 'package:redux_sign_in/redux/action/home_action.dart';
import 'package:redux_sign_in/redux/action/login_action.dart';
import 'package:redux_sign_in/redux/action/register_action.dart';
import 'package:redux_sign_in/redux/action/shop_action.dart';
import 'package:redux_sign_in/redux/reducer/shop_reducer.dart';

AppState appStateReducer(AppState state, dynamic action) {
  if (action is LoginAction) {
    return AppState(user_info: action.userLogin);
  } else if (action is RegisterAction) {
    return AppState(userRegister: action.userRegister);
  } else if (action is FetchProductsAction) {
    return AppState(home: action.home);
  } else {
    return AppState(shopItems: shopReducer(state.shopItems, action));
  }
}
