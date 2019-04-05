import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/shop_item.dart';
import 'package:redux_sign_in/data/viewmodel/shopping_cart_viewmodel.dart';

class ShoppingCart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ShoppingCartState();
  }
}

class ShoppingCartState extends State<ShoppingCart> {
  List<ShopItem> shopItems;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new StoreConnector(
        onInitialBuild: (ShoppingCartViewModel viewModel) {},
        onInit: (store) {
          shopItems = new List<ShopItem>();
          shopItems.add(new ShopItem(
              title: "Alma", description: "Dummy Text", price: "2 Azn"));
          shopItems.add(new ShopItem(
              title: "Armud", description: "Dummy Text", price: "2 Azn"));
          shopItems.add(new ShopItem(
              title: "Nar", description: "Dummy Text", price: "2 Azn"));
          shopItems.add(new ShopItem(
              title: "Uzum", description: "Dummy Text", price: "2 Azn"));
          store.state.shopItems = shopItems;
        },
        converter: (Store<AppState> store) =>
            ShoppingCartViewModel.create(store),
        builder: (BuildContext context, ShoppingCartViewModel viewModel) {
          return new Scaffold(
            appBar: new AppBar(
              backgroundColor: Colors.lightGreen,
              title: new Text("Your Cart List"),
              centerTitle: true,
            ),
            body: new Container(
              child: new ListView(
                  children: viewModel.shopItems.map((ShopItem shopItem) => new Container(
                    color: Colors.lightGreenAccent,
                    margin: EdgeInsets.all(16),
                    child: new ListTile(
                      title: new Container(
                          alignment: AlignmentDirectional.topEnd,
                          child: new RaisedButton(
                            onPressed: () {
                              return viewModel.deleteItem(shopItem);
                              print(viewModel.shopItems.toString());
                            },
                            child: new Text("X"),
                          )),
                      subtitle: new SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              child: new Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Container(
                                    child: new Text(shopItem.title),
                                  ),
                                  new Container(
                                    child: new Text(shopItem.price),
                                  ),
                                ],
                              ),
                            ),
                            new Container(
                              child: new Row(
                                children: <Widget>[
                                  new Container(
                                    child: new Icon(Icons.add),
                                  ),
                                  new Container(
                                    child: new Text("_"),
                                  ),
                                  new Container(
                                    child: new Icon(Icons.shopping_cart),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      leading: new Image(
                        image: AssetImage("images/img1.jpg"),
                        fit: BoxFit.contain,
                        height: 70,
                        width: 100,
                      ),
                    ),
                  )).toList(),
            ),
          ),);
        }
    );
  }
}