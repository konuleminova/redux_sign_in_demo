import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/data/viewmodel/viewmodel.dart';
import 'package:redux_sign_in/ui/page/home.dart';
import 'package:redux_sign_in/ui/page/index.dart';
import 'package:redux_sign_in/ui/page/login.dart';
import 'package:redux_sign_in/ui/page/register.dart';
import 'package:redux_sign_in/ui/page/splash.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/redux/reducer/app_state_reducer.dart';

void main() => runApp(MyApp());

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store =
        Store<AppState>(appStateReducer, initialState: AppState.initialState());
    // TODO: implement build
    return StoreProvider<AppState>(
        store: store,
        child: new MaterialApp(
          home: new Scaffold(
            body: StoreConnector(
                builder: (BuildContext context, ViewModel viewModel) =>
                    Container(
                      child: viewModel.onLogin(
                          new UserLogin(username: "konul", password: "aaa")),
                    ),
                converter: (store) => ViewModel.create(store)),
          ),
          routes: <String, WidgetBuilder>{
            "/splash": (BuildContext context) => SplashScreen(),
            "/login": (BuildContext context) => LoginPage(),
            "/register": (BuildContext context) => RegisterPage(),
            "/home": (BuildContext context) => HomePage()
          },
        ));
  }
}
*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store =
        Store<AppState>(appStateReducer, initialState: AppState.initialState());
    // TODO: implement build
    return StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        home: IndexPage(store: store,),
        routes: <String, WidgetBuilder>{
          "/index": (BuildContext context) => IndexPage(),
          "/login": (BuildContext context) => LoginPage(),
          "/register": (BuildContext context) => RegisterPage(),
          "/home": (BuildContext context) => HomePage()
        },
      ),
    );
  }
}