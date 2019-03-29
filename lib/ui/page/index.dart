import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/ui/page/home.dart';
import 'package:redux_sign_in/ui/page/login.dart';
import 'package:redux_sign_in/util/sharedpref.dart';

class IndexPage extends StatefulWidget {
  final Store<AppState> store;

  IndexPage({this.store});

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool isLoggedIn = false;
  bool progress = true;

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: SharedPrefUtil().getUserHasLogin(),
      builder: (BuildContext context, AsyncSnapshot shot) {
        if (shot.hasData) {
          var loginState = widget.store.state.isLogin;
          loginState = shot.data;
          if (loginState) {
            return HomePage();
          } else {
            return LoginPage(store: widget.store);
          }
        }
      },
    );
  }
}
