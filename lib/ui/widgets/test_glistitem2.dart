import 'package:flutter/material.dart';
import 'package:redux_sign_in/ui/widgets/gtypography.dart';

class GroceryListItemTwo extends StatelessWidget {
  const GroceryListItemTwo({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.image,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Container(
            height: 80.0,
            width: 100,
            child: Image.asset(
              image,
              height: 80.0,
            )),
        title: Container(
          height: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new GroceryTitle(text: title),
              new GrocerySubtitle(text: subtitle),
              new GrocerySubtitle(text: "1 AZN")
            ],
          ),
        ),
        trailing: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
      new GestureDetector(
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
        ),
        onTap: () {
         // setState(() {
           /// widget.isAdded = true;
         // });
        },
      )
          ],
        ),
      ),
    );
  }
}
