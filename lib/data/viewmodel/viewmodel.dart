import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/data/model/user_register.dart';
import 'package:redux_sign_in/redux/action/OnLoginAction.dart';
import 'package:redux_sign_in/redux/action/OnRegisterAction.dart';
import 'package:redux_sign_in/redux/middleware/thunkfunction.dart';
class ViewModel {
  Function(String username,String password) buildLogin;

  ViewModel({this.buildLogin});

  factory ViewModel.create(Store<AppState> store) {
    _buildLogin(String username,String password) {
      store.dispatch(loginThunkFunction(username,password));
    }

    return ViewModel(
        buildLogin: _buildLogin);
  }
}
