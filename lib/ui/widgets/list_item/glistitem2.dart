import 'package:flutter/material.dart';
import 'package:redux_sign_in/ui/widgets/gtile_title.dart';

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
        margin: EdgeInsets.all(12),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 3.0,
          child: new Container(child: ListTile(

            leading: Container(
                height: 80.0,
                width: 100,
                child: Image.asset(
                  image,
                  height: 80.0,
                )),
            title: Container(
              height: 110.0,
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
          ),color: Colors.white,)
        ));
  }
}
// is is Added case UI view
/*
   new Container(
        width: 80,
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
            ),
            new Text(
         "2",
              style: new TextStyle(fontSize: 18),
            ),
            new GestureDetector(
              child: new Icon(Icons.add),
              onTap: () {
              //  setState(() {
               //   amount++;
                //});
              },
            ),
          ],
        ),
      )
 */
