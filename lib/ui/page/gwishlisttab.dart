import 'package:flutter/material.dart';
import 'package:redux_sign_in/data/model/product_model.dart';
import 'package:redux_sign_in/ui/widgets/list_item/glistitem2.dart';

class GroceryWishlistTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(
          "Wish List",
        ),
        backgroundColor: Colors.lightGreen,
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
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                _buildWhishListItem(new Product(
                    image: "images/img2.jpg",
                    title: "Sample",
                    subtitle: "1kq",price: "1 AZN")),
                _buildWhishListItem(new Product(
                    image: "images/img2.jpg",
                    title: "Sample",
                    subtitle: "2kq ",price: "1 AZN")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildWhishListItem(Product product) => GroceryListItemTwo(product);
}
