import 'package:flutter/material.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/redux/action/OnLoginAction.dart';
import 'package:redux_sign_in/redux/action/OnRegisterAction.dart';

AppState appStateReducer(AppState state, dynamic action) {
  if (action is OnLoginAction) {
    return AppState(userLogin: action.userLogin);
  }
  if (action is OnRegisterAction) {
    return AppState(userRegister: action.userRegister);
  }
}
