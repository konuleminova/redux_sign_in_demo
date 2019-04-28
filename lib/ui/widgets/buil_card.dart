import 'package:flutter/material.dart';
import 'package:redux_sign_in/ui/widgets/glistitem1.dart';

Widget buildNewArrivalsRow(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(10.0),
    height: 350.0,
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: InkWell(
            child: GroceryListItemOne(
              image: "images/img2.jpg",
              subtitle: "1 kg",
              title: "Local Mango",
              amount: 1,
              price: "1 AZN",
              isAdded: false,
              isLiked: true,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            child: GroceryListItemOne(
              image: "images/img2.jpg",
              subtitle: "1 kg",
              title: "Local Mango",
              amount: 1,
              price: "1 AZN",
              isAdded: false,
              isLiked: true,
            ),
          ),
        ),
      ],
    ),
  );
}
