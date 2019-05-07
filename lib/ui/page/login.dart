import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state_model.dart';
import 'package:redux_sign_in/data/model/login_model.dart';
import 'package:redux_sign_in/data/viewmodel/login_viewmodel.dart';
import 'package:redux_sign_in/redux/reducer/app_state_reducer.dart';
import 'package:redux_sign_in/ui/page/index.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

void _showToast(BuildContext context, String content) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(SnackBar(
    content: Text(content),
    action:
        SnackBarAction(label: "UNDO", onPressed: scaffold.hideCurrentSnackBar),
  ));
}

Widget get _loadingView {
  return new Center(
    child: new CircularProgressIndicator(),
  );
}

class LoginState extends State<LoginPage> {
  TextEditingController _controllerUsername, _controllerPass;
  bool _validateUsername = false;
  bool _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    _controllerUsername = TextEditingController();
    _controllerPass = TextEditingController();

    // TODO: implement build
    return StoreConnector(
      converter: (Store<AppState> store) => ViewModel.create(store),
      onInit: (store) {
        store.onChange.listen((state) {
          if (state != null) {
            if (state.user_info.isAdded == STATUS.SUCCESS) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (Route<dynamic> route) => false);
            } else if (state.user_info.isAdded == STATUS.LOADING) {
              print("loading..");
            } else if (state.user_info.isAdded == STATUS.FAIL) {
              _showToast(context, "Username or Password is wrong.");
            } else if (state.user_info.isAdded == STATUS.NETWORK_ERROR) {
              _showToast(context, "No internet connection");
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
                    decoration: InputDecoration(
                        hintText: "Username",
                        errorText:
                            _validateUsername ? "Field can't be empty." : null),
                    controller: _controllerUsername,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        errorText:
                            _validateUsername ? "Field can't be empty." : null),
                    controller: _controllerPass,
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        print("click");
                        setState(() {
                          _controllerUsername.text.isEmpty
                              ? _validateUsername = true
                              : _validateUsername = false;
                          _controllerPass.text.isEmpty
                              ? _validatePassword = true
                              : _validatePassword = false;
                        });
                        if (!_validateUsername) {
                          viewModel.buildLogin(
                              _controllerUsername.text, _controllerPass.text);
                        }
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
                  ),
                ],
              ),
            )),
          ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controllerUsername.dispose();
    _controllerPass.dispose();
  }
}
