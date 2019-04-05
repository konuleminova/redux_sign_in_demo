import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/viewmodel/shopping_cart_viewmodel.dart';

class ShoppingCart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ShoppingCartState();
  }
}

class ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new StoreConnector(
      converter: (Store<AppState> store) => ShoppingCartViewModel.create(store),
      builder: (BuildContext context, ShoppingCartViewModel viewModel) {
        return new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.lightGreen,
            title: new Text("Your Cart List"),
            centerTitle: true,
          ),
          body: new Container(
              child: new ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      margin: EdgeInsets.all(16),
                      child: new ListTile(
                        title: new SizedBox(
                          height: 90,
                          width: 200,
                          child: new Stack(
                            children: <Widget>[
                              new Container(
                                child: new Text("Alma"),
                                alignment: AlignmentDirectional.topStart,
                              ),
                              new Container(
                                alignment: AlignmentDirectional.centerStart,
                                child: new Text("1kq: 2 AZN"),
                              ),
                              new Container(
                                alignment: AlignmentDirectional.bottomStart,
                                child: new Icon(Icons.add),
                              ),
                              new Container(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: new Icon(Icons.shopping_cart),
                              )
                            ],
                          ),
                        ),
                        leading: new Image(
                          image: AssetImage("images/img1.jpg"),
                          fit: BoxFit.cover,
                          height: 90,
                          width: 120,
                        ),
                      ),
                    );
                  })),
        );
      },
    );
  }
}
