import 'package:flutter/material.dart';
import 'package:redux_sign_in/ui/widgets/oval_tap.dart';
import 'package:redux_sign_in/ui/widgets/test_glistitem2.dart';

class GroceryCartTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightGreen,
        title: new Text("Shopping List"),
        actions: <Widget>[
          new Container(
            child: new Icon(Icons.delete,color: Colors.white,),margin: EdgeInsets.only(right: 16),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                GroceryListItemTwo(
                  image: "images/img2.jpg",
                  subtitle: "4 in a pack",
                  title: "Pineapple",
                ),
                GroceryListItemTwo(
                  image: "images/img1.jpg",
                  subtitle: "1 kg",
                  title: "cabbage",
                ),
                GroceryListItemTwo(
                  image: "images/img2.jpg",
                  subtitle: "4 in a pack",
                  title: "Pineapple",
                ),
                GroceryListItemTwo(
                  image: "images/img1.jpg",
                  subtitle: "1 kg",
                  title: "cabbage",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          _buildTotals()
        ],
      ),
    );
  }

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
            EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
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
}