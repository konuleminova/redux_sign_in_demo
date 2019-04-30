import 'package:redux_sign_in/data/model/login_model.dart';
import 'package:redux_sign_in/data/model/register_model.dart';

class LoginAction {
  String username;
  String password;
  bool isLogin = false;
  STATUS status;

  LoginAction({this.username, this.password, this.isLogin, this.status});

}
