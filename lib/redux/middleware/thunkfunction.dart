import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/redux/action/OnLoginAction.dart';
import 'package:redux_sign_in/util/networkutil.dart';
import 'package:redux_sign_in/util/sharedpref.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> loginThunkFunction(String username, String password) {
  return (Store<AppState> store) async {
    AppState responseBody = await NetworkUtils.loginUser(username, password);
    print(responseBody.toString() + "...");
    UserLogin userLogin = new UserLogin();
    if (responseBody != null) {
      if (responseBody.code == 1001) {
        userLogin.username = username;
        userLogin.password = password;
        userLogin.isLogin = true;
        SharedPrefUtil sharedPrefUtil = new SharedPrefUtil();
        sharedPrefUtil.setUserHasLogin(userLogin.isLogin);
        store.dispatch(OnLoginAction(userLogin: userLogin));
      } else {
        userLogin.isLogin = false;
        store.dispatch(OnLoginAction(userLogin: userLogin));
      }
    }
  };
}
