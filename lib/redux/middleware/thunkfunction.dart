import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/redux/action/LoginSuccessAction.dart';
import 'package:redux_sign_in/util/networkutil.dart';
import 'package:redux_sign_in/util/sharedpref.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> loginThunkAction(String username, String password) {
  return (Store<AppState> store) async {
    var response = await NetworkUtils.loginUser(username, password);
    print(response.toString()+"...");
    if (response != null) {
      store.dispatch(LoginSuccessAction(isLoginSuccess: true));
      store.state.isLogin = true;
      SharedPrefUtil sharedPrefUtil = new SharedPrefUtil();
      sharedPrefUtil.setUserLogin(store.state.isLogin);
    }
  };
}
