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
  ShoppingCartViewModel viewModel;

  var increment = 1;

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
          this.viewModel = viewModel;
          return new Scaffold(
              appBar: new AppBar(
                backgroundColor: Colors.lightGreen,
                title: new Text("Your Cart List"),
                centerTitle: true,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _shopHeader(),
                  _shopBody(),
                  _shopFooter(),
                ],
              ));
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

  Widget _shopListItem(ShoppingCartViewModel viewModel, ShopItem shopItem) =>
      new Container(
          decoration: new BoxDecoration(color: Colors.grey[100], boxShadow: [
            new BoxShadow(color: Colors.grey[100], blurRadius: 20)
          ]),
          margin: EdgeInsets.only(left: 16, right: 18, top: 8, bottom: 8),
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
                      alignment: AlignmentDirectional.centerStart,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                new Container(
                                  child: new Text(
                                    shopItem.title,
                                    style: new TextStyle(
                                        color: Colors.green, fontSize: 20),
                                  ),
                                ),
                                new Container(
                                    child: new Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Text(shopItem.price,
                                        style:
                                            new TextStyle(color: Colors.black)),
                                    new Container(
                                      child: new Text(
                                          increment.toString() + "kq "),
                                      margin:
                                          EdgeInsets.only(left: 16, right: 8),
                                    ),
                                  ],
                                )),
                                new Container(
                                  child: new Text(shopItem.price),
                                ),
                              ],
                            ),
                            alignment: FractionalOffset.centerLeft,
                          ),
                          new Positioned(
                              right: 30,
                              top: 5,
                              bottom: 5,
                              child: new Container(
                                margin: EdgeInsets.all(16),
                                child: new Container(
                                  decoration: new BoxDecoration(
                                      border:
                                          new Border.all(color: Colors.grey),
                                      borderRadius:
                                          new BorderRadius.circular(20)),
                                  child: new Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      new GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (increment > 0) {
                                              increment = increment - 1;
                                            }
                                          });
                                        },
                                        child: new Container(
                                          child: new Icon(Icons.remove),
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
                                      new GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            increment = increment + 1;
                                          });
                                        },
                                        child: new Container(
                                          child: new Icon(Icons.add),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          new GestureDetector(
                            onTap: () {
                              return viewModel.removeItem(shopItem);
                              print(viewModel.shopItems.toString());
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
          ));

  Widget _shopHeader() => new Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(26),
        color: Colors.grey[200],
        child: new Text(
          "Sebet",
          style: new TextStyle(color: Colors.green, fontSize: 20),
          textAlign: TextAlign.left,
        ),
        width: width,
      );

  Widget _shopBody() => new Expanded(
        child: new Container(
          margin: EdgeInsets.only(bottom: 16),
          child: new ListView(
            children: viewModel.shopItems
                .map((ShopItem shopItem) => _shopListItem(viewModel, shopItem))
                .toList(),
          ),
        ),
      );

  Widget _shopFooter() => new Container(
        child: new Stack(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(16),
              child: new ButtonTheme(
                child: new RaisedButton(
                  onPressed: () {
                    return Navigator.pushNamed(context, "/checkout");
                  },
                  child: new Text(
                    "Checkout",
                    style: new TextStyle(color: Colors.white),
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                buttonColor: Colors.green,
              ),
              alignment: AlignmentDirectional.bottomEnd,
            ),
            new Positioned(
              child: new Container(
                child: new Text(
                  "Umumi mebleg",
                  style: new TextStyle(color: Colors.green),
                ),
                alignment: Alignment.bottomRight,
              ),
              top: 20,
              left: 16,
            ),
            new Positioned(
              child: new Container(
                child: new Text(
                  "12.00 AZN",
                  style: new TextStyle(color: Colors.green, fontSize: 20),
                ),
                alignment: Alignment.bottomRight,
              ),
              top: 40,
              left: 16,
            )
          ],
        ),
        color: Colors.grey[200],
      );
}
