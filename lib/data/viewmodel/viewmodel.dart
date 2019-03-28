import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/data/model/user_register.dart';
import 'package:redux_sign_in/redux/action/OnLoginAction.dart';
import 'package:redux_sign_in/redux/action/OnRegisterAction.dart';

class ViewModel {
  Function(UserLogin) onLogin;
  Function(UserRegister) onRegister;

  ViewModel({this.onLogin, this.onRegister});

  factory ViewModel.create(Store<AppState> store) {
    _onLogin(UserLogin userLogin) {
      store.dispatch(OnLoginAction(userLogin: userLogin));
    }

    _onRegister(UserRegister userRegister) {
      store.dispatch(OnRegisterAction(userRegister: userRegister));
    }

    return ViewModel(onLogin: _onLogin, onRegister: _onRegister);
  }
}
