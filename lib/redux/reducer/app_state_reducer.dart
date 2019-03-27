import 'package:flutter/material.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/redux/action/OnLoginAction.dart';
import 'package:redux_sign_in/redux/action/OnRegisterAction.dart';

AppState appStateReducer(AppState state, dynamic action) {
  if (action is OnLoginAction) {
    return AppState(isLoading: false, userLogin: state.userLogin);
  }
 else if (action is OnRegisterAction) {
    return AppState(isLoading: false, userRegister: state.userRegister);
  }
}
