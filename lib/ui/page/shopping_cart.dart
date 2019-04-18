import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/shop_item.dart';
import 'package:redux_sign_in/data/viewmodel/shopping_cart_viewmodel.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ShoppingCartPageState();
  }
}

class ShoppingCartPageState extends State<ShoppingCartPage> {
  List<ShopItem> shopItems;
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return new StoreConnector(
        onInitialBuild: (ShoppingCartViewModel viewModel) {},
        onInit: (store) {
          shopItems = new List<ShopItem>();
          shopItems.add(new ShopItem(
              title: "Alma", description: "Dummy Text", price: "1 kq 2 Azn"));
          shopItems.add(new ShopItem(
              title: "Armud", description: "Dummy Text", price: "2 Azn"));
          shopItems.add(new ShopItem(
              title: "Nar", description: "Dummy Text", price: "2 Azn"));
          shopItems.add(new ShopItem(
              title: "Uzum", description: "Dummy Text", price: "2 Azn"));
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
            body: new Stack(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: new ListView(
                    children: viewModel.shopItems
                        .map((ShopItem shopItem) => new Container(
                            decoration: new BoxDecoration(
                                color: Colors.grey[100],
                                boxShadow: [
                                  new BoxShadow(
                                      color: Colors.grey[100], blurRadius: 20)
                                ]),
                            margin: EdgeInsets.only(
                                left: 16, right: 18, top: 8, bottom: 8),
                            child: new Card(
                              child: new SizedBox(
                                  height: 120,
                                  width: width,
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Container(
                                        margin: EdgeInsets.all(16),
                                        child: new Image(
                                          image: AssetImage("images/img1.jpg"),
                                          fit: BoxFit.contain,
                                          height: 70,
                                          width: 100,
                                        ),
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                      ),
                                      new Container(
                                        margin: EdgeInsets.only(right: 8),
                                        decoration: _verticalDivider(),
                                      ),
                                      new Expanded(
                                        // color: Colors.red,
                                        child: new Stack(
                                          children: <Widget>[
                                            new Container(
                                              child: new Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  new Container(
                                                    child: new Text(
                                                      shopItem.title,
                                                      style: new TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  new Container(
                                                    child: new Text(
                                                        shopItem.price),
                                                  ),
                                                  new Container(
                                                    child: new Text(
                                                        shopItem.price),
                                                  ),
                                                ],
                                              ),
                                              alignment:
                                                  FractionalOffset.centerLeft,
                                            ),
                                            new Positioned(
                                                right: 30,
                                                top: 5,
                                                bottom: 5,
                                                child: new Container(
                                                  margin: EdgeInsets.all(16),
                                                  child: new Container(
                                                    decoration: new BoxDecoration(
                                                        border: new Border.all(
                                                            color: Colors.grey),
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(20)),
                                                    child: new Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: <Widget>[
                                                        new GestureDetector(
                                                          child: new Container(
                                                            child: new Icon(
                                                                Icons.remove),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                          child: Divider(
                                                            color: Colors.grey,
                                                            indent: 1,
                                                            height: 2,
                                                          ),
                                                        ),
                                                        new Container(
                                                          child: new Icon(
                                                              Icons.add),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                            new GestureDetector(
                                              onTap: () {
                                                return viewModel
                                                    .removeItem(shopItem);
                                                print(viewModel.shopItems
                                                    .toString());
                                              },
                                              child: new Container(
                                                margin: EdgeInsets.all(8),
                                                alignment: Alignment.topRight,
                                                child: new Icon(
                                                  Icons.highlight_off,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            )))
                        .toList(),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.all(16),
                  child: new ButtonTheme(
                    child: new RaisedButton(
                      onPressed: () {
                        return Navigator.pushNamed(context, "/checkout");
                      },
                      child: new Text("Checkout"),
                    ),
                    minWidth: width,
                  ),
                  alignment: AlignmentDirectional.bottomCenter,
                  width: width,
                )
              ],
            ),
          );
        });
  }

  _verticalDivider() => BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
      );
}
