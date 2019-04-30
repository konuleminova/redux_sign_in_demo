import 'package:flutter/material.dart';
import 'package:redux_sign_in/data/model/app_state_model.dart';
import 'package:redux_sign_in/redux/reducer/home_reducer.dart';
import 'package:redux_sign_in/redux/reducer/login_reducer.dart';
import 'package:redux_sign_in/redux/reducer/shop_reducer.dart';

AppState appStateReducer(AppState state, dynamic action) {
    return AppState(
        shopItems: shopReducer(
          state.shopItems,
          action,
        ),
        user_info: loginReducer(state.user_info, action),
        home: homeReducer(state.home, action));
  }
