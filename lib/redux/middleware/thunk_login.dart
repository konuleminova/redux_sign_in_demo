import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/redux/action/OnLoginAction.dart';
import 'package:redux_sign_in/util/networkutil.dart';
import 'package:redux_sign_in/util/sharedpref_util.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> loginThunkFunction(String username, String password) {
  return (Store<AppState> store) async {
    UserLogin userLogin = new UserLogin();
    userLogin.status = STATUS.LOADING;
    store.dispatch(OnLoginAction(userLogin: userLogin));
    AppState responseBody = await NetworkUtils.loginUser(username, password);
    print(responseBody.toString()+"..");
    if (responseBody != null) {
      if (responseBody.code == 1001) {
        userLogin.username = username;
        userLogin.password = password;
        userLogin.isLogin = true;
        userLogin.status = STATUS.SUCCESS;
        SharedPrefUtil sharedPrefUtil = new SharedPrefUtil();
        sharedPrefUtil.setUserHasLogin(userLogin.isLogin);
        store.dispatch(OnLoginAction(userLogin: userLogin));
      } else {
        userLogin.status = STATUS.FAIL;
        store.dispatch(OnLoginAction(userLogin: userLogin));
      }
    } else {
      userLogin.status = STATUS.NETWORK_ERROR;
      store.dispatch(OnLoginAction(userLogin: userLogin));
    }
  };
}
