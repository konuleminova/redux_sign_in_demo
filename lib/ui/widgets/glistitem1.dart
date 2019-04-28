import 'package:flutter/material.dart';
import 'package:redux_sign_in/ui/widgets/gtypography.dart';
import 'package:redux_sign_in/ui/widgets/rating_star.dart';

class GroceryListItemOne extends StatefulWidget {
  final String image, title, price, subtitle;
  final int amount;
  bool isAdded, isLiked;

  GroceryListItemOne(
      {this.image,
      this.title,
      this.price,
      this.subtitle,
      this.amount,
      this.isAdded,
      this.isLiked});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new GroceryListItemOneState();
  }
}

class GroceryListItemOneState extends State<GroceryListItemOne> {
  int amount = 1;
  String image, title, price, subtitle;

  @override
  Widget build(BuildContext context) {
    //amount = widget.amount;
    image = widget.image;
    title = widget.title;
    price = widget.price;
    subtitle = widget.subtitle;

    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
          boxShadow: [
            BoxShadow(
                blurRadius: 10.0,
                color: Colors.grey.shade200,
                spreadRadius: 2.0)
          ]),
      margin: EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      child: Image.network(
                        image,
                      ),
                      height: 150,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 4)),
                  new GroceryTitle(text: title),
                  new Container(
                      height: 20,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new RatingStarWidget(1, 1, 16),
                              new Container(
                                child: Text("4.2"),
                              ),
                            ],
                          ),
                          new Container(
                            child: IconButton(
                              icon: Icon(
                                widget.isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.grey[400],
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (widget.isLiked) {
                                    widget.isLiked = false;
                                  } else {
                                    widget.isLiked = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      )),
                  new Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new GrocerySubtitle(text: subtitle),
                      new GrocerySubtitle(text: price),
                    ],
                  ),
                  _updateContainer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _updateContainer() {
    if (!widget.isAdded) {
      return new GestureDetector(
        child: new Container(
          child: new Container(
            padding: EdgeInsets.all(8),
            color: Colors.lightGreen,
            child: new SizedBox(
              child: new Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              height: 20,
              width: 20,
            ),
          ),
          alignment: Alignment.topRight,
        ),
        onTap: () {
          setState(() {
            widget.isAdded = true;
          });
        },
      );
    } else {
      return new Container(
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.only(top: 8, bottom: 8),
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        alignment: Alignment.topRight,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new GestureDetector(
              child: new Icon(Icons.remove),
              onTap: () {
                setState(() {
                  amount--;
                  if (amount < 1) {
                    widget.isAdded = false;
                    amount = 1;
                  }
                });
              },
            ),
            new Text(
              amount.toString(),
              style: new TextStyle(fontSize: 18),
            ),
            new GestureDetector(
              child: new Icon(Icons.add),
              onTap: () {
                setState(() {
                  amount++;
                });
              },
            ),
          ],
        ),
      );
    }
  }
}