import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/viewmodel/viewmodel.dart';
import 'package:redux_sign_in/ui/page/home.dart';
import 'package:redux_sign_in/ui/page/login.dart';
import 'package:redux_sign_in/ui/page/register.dart';
import 'package:redux_sign_in/util/sharedpref.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool isLoggedIn = false;
  bool progress = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new FutureBuilder(
        future: SharedPrefUtil().getUserHasLogin(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              isLoggedIn = snapshot.data;
              if (isLoggedIn) {
                return HomePage();
              } else {
                return LoginPage();
              }
            }
          } else {
            return new CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }
}
