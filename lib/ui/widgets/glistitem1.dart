import 'package:flutter/material.dart';
import 'package:redux_sign_in/ui/widgets/gtypography.dart';
import 'package:redux_sign_in/ui/widgets/rating_star.dart';

class GroceryListItemOne extends StatefulWidget {
  final String image, title, price, subtitle;
  final int amount;

  const GroceryListItemOne({
    Key key,
    @required this.image,
    @required this.title,
    @required this.subtitle,
    this.price,
    this.amount,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new GroceryListItemOneState();
  }
}

class GroceryListItemOneState extends State<GroceryListItemOne> {
  bool status = true;
  int amount=1;
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
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
          boxShadow: [
            BoxShadow(
                blurRadius: 10.0,
                color: Colors.grey.shade200,
                spreadRadius: 2.0)
          ]),
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                      child: Image.asset(
                    image,
                    height: 150.0,
                  )),
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
                                Icons.favorite_border,
                                color: Colors.grey[400],
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      )),
                  new Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new GrocerySubtitle(text: subtitle),
                      new GrocerySubtitle(text: price ),
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
    if (status) {
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
              height: 25,
              width: 25,
            ),
          ),
          alignment: Alignment.topRight,
        ),
        onTap: () {
          setState(() {
            status = false;
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
                    status = true;
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
