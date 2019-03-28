import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/data/model/user_register.dart';
import 'package:redux_sign_in/redux/action/LoginSuccessAction.dart';
import 'package:redux_sign_in/redux/action/OnLoginAction.dart';
import 'package:redux_sign_in/redux/action/OnRegisterAction.dart';

class ViewModel {
  Function(UserLogin) onLogin;
  Function(UserRegister) onRegister;
  Function(BuildContext context) loginSuccess;

  ViewModel({this.onLogin, this.onRegister, this.loginSuccess});

  factory ViewModel.create(Store<AppState> store) {
    _onLogin(UserLogin userLogin) {
      store.dispatch(OnLoginAction(userLogin: userLogin));
    }

    _onRegister(UserRegister userRegister) {
      store.dispatch(OnRegisterAction(userRegister: userRegister));
    }

    _onLoginSuccess(BuildContext context) {
      print("loginn");
      store.dispatch(loginThunkAction(context,"http://35.240.80.11/app/login/",
          body: {"username": "konuld", "password": "aaa"}));
    }

    return ViewModel(
        onLogin: _onLogin,
        onRegister: _onRegister,
        loginSuccess: _onLoginSuccess);
  }
}
