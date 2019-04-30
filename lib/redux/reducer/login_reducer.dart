import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/login_model.dart';
import 'package:redux_sign_in/redux/action/login_action.dart';

Reducer<UserLogin> loginReducer = combineReducers<UserLogin>(
    [TypedReducer<UserLogin, LoginAction>(signInReducer)]);

UserLogin signInReducer(UserLogin state, LoginAction action) {
  return state.copyWith(
      username: action.username,
      password: action.password,
      status: action.status,
      isLogin: action.isLogin);
}
