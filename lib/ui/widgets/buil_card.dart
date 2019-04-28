import 'package:flutter/material.dart';
import 'package:redux_sign_in/ui/widgets/glistitem1.dart';

Widget buildNewArrivalsRow(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(10.0),
    height: 340.0,
    child: Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            child: GroceryListItemOne(
              image: "images/img2.jpg",
              subtitle: "1 kg",
              title: "Local Mango",
              amount: 1,
              price: "1 AZN",
              isAdded: false,
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            child: GroceryListItemOne(
              image: "images/img1.jpg",
              subtitle: "6 in a pack",
              title: "Broccoli",
              amount: 2,
              price: "2 AZN",
              isAdded: true,
            ),
          ),
        ),

      ],
    ),
  );
}