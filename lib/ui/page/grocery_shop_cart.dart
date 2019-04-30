import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state_model.dart';
import 'package:redux_sign_in/data/model/product_model.dart';
import 'package:redux_sign_in/data/model/shop_model.dart';
import 'package:redux_sign_in/data/viewmodel/shop_viewmodel.dart';
import 'package:redux_sign_in/ui/widgets/oval_tap.dart';
import 'package:redux_sign_in/ui/widgets/list_item/glistitem2.dart';

class GroceryShopCartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new GroceryCartState();
  }
}

class GroceryCartState extends State<GroceryShopCartPage> {
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
         // store.state.products[0].status=true;
         // shopItems.clear();
          for(int i=0;i<store.state.products.length;i++){

            if (store.state.products[i].status) {
              shopItems.add(new ShopItem(
                  title: store.state.products[i].title,
                  description: store.state.products[i].subtitle,
                  price: "2 Azn",));
            }
          }
          /*if(store.state.products[0].status){
            shopItems.add(new ShopItem(
                title: store.state.products[0].title,
                description: "Dummy Text",
                price: "2 Azn"));
          }
          */
          store.state.shopItems.clear();
         store.state.shopItems.addAll(shopItems);
          //this.shopItems=store.state.shopItems;
        },
        converter: (Store<AppState> store) =>
            ShoppingCartViewModel.create(store),
        builder: (BuildContext context, ShoppingCartViewModel viewModel) {
          this.viewModel = viewModel;
          return new Scaffold(
            appBar: new AppBar(
              backgroundColor: Colors.lightGreen,
              title: new Text("Shopping List"),
              actions: <Widget>[
                new Container(
                  child: new Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(right: 16),
                )
              ],
            ),
            body: Column(
              children: <Widget>[
                Expanded(child: _shopBody()),
                SizedBox(
                  height: 10.0,
                ),
                _buildTotals()
              ],
            ),
          );
        });
  }

  Widget _shopBody() => new Container(
        margin: EdgeInsets.only(bottom: 16, top: 16, left: 10, right: 12),
        child: new ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: viewModel.shopItems
              .map((ShopItem shopItem) => _builShopListItem(shopItem))
              .toList(),
        ),
      );

  Widget _buildTotals() {
    return ClipOval(
      clipper: OvalTopBorderClipper(),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0,
                color: Colors.grey.shade700,
                spreadRadius: 80.0),
          ],
          color: Colors.white,
        ),
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Subtotal"),
                Text("14 AZN"),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Delivery fee"),
                Text("2 AZN"),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Total"),
                Text("35 AZN"),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              color: Colors.green,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Checkout", style: TextStyle(color: Colors.white)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _builShopListItem(ShopItem shopItem) => new Stack(
        children: <Widget>[
          GroceryListItemTwo(new Product(
              image: "images/img2.jpg",
              title: shopItem.title,
              subtitle: shopItem.description,
              price: shopItem.price,
              isLiked: false,
              status: true,
              amount: 1)),
          Positioned(
            top: 5,
            right: 0,
            child: Container(
              height: 30,
              width: 30,
              alignment: Alignment.topRight,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                padding: EdgeInsets.all(0.0),
                color: Colors.pinkAccent,
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () {
                  return viewModel.removeShopItem(shopItem);
                  print(viewModel.shopItems.toString());
                },
              ),
            ),
          ),
        ],
      );
}
