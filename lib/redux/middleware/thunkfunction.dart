import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/redux/action/LoginSuccessAction.dart';
import 'package:redux_sign_in/util/networkutil.dart';
import 'package:redux_sign_in/util/sharedpref.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

ThunkAction<AppState> loginThunkAction(String username, String password) {
  return (Store<AppState> store) async {
    var response = await NetworkUtils.loginUser(username, password);
    if (response != null) {
      store.dispatch(LoginSuccessAction(isLoginSuccess: true));
      store.state.isLogin = true;
      SharedPrefUtil sharedPrefUtil = new SharedPrefUtil();
      sharedPrefUtil.setUserLogin(store.state.isLogin);
    }
  };
}
