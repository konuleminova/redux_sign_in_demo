import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/viewmodel/viewmodel.dart';
import 'package:redux_sign_in/redux/reducer/app_state_reducer.dart';

class LoginPage extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreConnector(
      converter: (Store<AppState> store) => ViewModel.create(store),
      onInit: (store) {
        store.onChange.listen((state) {
            if (state != null) {
              if (state.isLogin) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/home', (Route<dynamic> route) => false);
              }
            }
        });
      },
      builder: (BuildContext context, ViewModel viewModel) => new Scaffold(
            body: new Container(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: "Username"),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        print("click");
                        viewModel.buildLogin(context);
                      },
                      child: new Text("Login"),
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        "Register =>",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            )),
          ),
    );
  }
}
