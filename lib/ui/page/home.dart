import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/data/viewmodel/viewmodel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: StoreConnector<AppState, ViewModel>(
          builder: (BuildContext context, ViewModel viewModel) => Container(
                child: viewModel
                    .onLogin(new UserLogin(username: "konul", password: "aaa")),
              ),
          converter: (store) => ViewModel.create(store)),
    );
  }
}
