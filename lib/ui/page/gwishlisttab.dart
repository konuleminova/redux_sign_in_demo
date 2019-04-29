import 'package:flutter/material.dart';
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
        actions: <Widget>[new Container(
          child: new Icon(
            Icons.delete,
            color: Colors.white,
          ),
          margin: EdgeInsets.only(right: 16),
        )],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                _buildWhishListItem(),
                _buildWhishListItem(),
                _buildWhishListItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildWhishListItem() =>  GroceryListItemTwo(
    image: "images/img1.jpg",
    subtitle: "4 in a pack",
    title: "Pineapple",
  );
}
