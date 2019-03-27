
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/ui/page/login.dart';
import 'package:redux_sign_in/ui/page/register.dart';

class IndexPage extends StatelessWidget {
  final Store<AppState> store;
  IndexPage({this.store});

  @override
  Widget build(BuildContext context) {
    var status = store.state.userLogin;
    if(status.username=="konuljk") {
      return LoginPage();
    } else {
      return RegisterPage();
    }
  }

}
