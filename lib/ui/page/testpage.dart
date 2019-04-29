import 'package:flutter/material.dart';
import 'package:redux_sign_in/ui/widgets/rating_star.dart';
import 'package:redux_sign_in/ui/widgets/test_glistitem2.dart';
import 'package:redux_sign_in/ui/widgets/gtypography.dart';

class GroceryDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text("Details"),
      ),
      body: _buildPageContent(context),
    );
  }

  Widget _buildPageContent(context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildItemCard(context),
              new Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: new Container(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            GroceryTitle(text: "Local Cabbage"),
                            SizedBox(
                              height: 5.0,
                            ),
                            GrocerySubtitle(text: "1 kg" + "/ 1 azn"),
                            new Container(
                              margin: EdgeInsets.all(6),
                              child: RatingStarWidget(5, 4, 22),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(left: 20, top: 8),
                      )),
                  Expanded(
                    child: new Container(
                      child: _addWidget(context),
                      margin: EdgeInsets.only(right: 16, top: 8,left: 16),
                    ),
                    flex: 1,
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.all(20.0),
                  child: GrocerySubtitle(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras scelerisque nibh ut eros suscipit, vel cursus dolor imperdiet. Proin volutpat ligula eget purus maximus tristique. Pellentesque ullamcorper libero vitae metus feugiat fringilla. Ut luctus neque sed tortor placerat, faucibus mollis risus ullamcorper. Cras at nunc et odio ultrices tempor et.")),
              new Container(
                decoration: BoxDecoration(
                    border: new Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(4)),
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                padding: EdgeInsets.all(10),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(top: 8),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new CircleAvatar(
                            child: Icon(
                              Icons.chat,
                              size: 15,
                            ),
                            maxRadius: 16,
                            backgroundColor: Colors.green,
                          ),
                          new Container(
                            margin: EdgeInsets.only(left: 10),
                            child: new Text("Read Reviews (1)"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: GroceryTitle(text: "Related Items")),
              GroceryListItemTwo(
                  title: "Broccoli",
                  image: "images/img1.jpg",
                  subtitle: "1 kg"),
              GroceryListItemTwo(
                  title: "Cabbage",
                  image: "images/img3.jpg",
                  subtitle: "1 kg"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItemCard(context) {
    return Stack(
      children: <Widget>[
        Card(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'images/img1.jpg',
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _addWidget(BuildContext context) => new GestureDetector(
        child: new Container(
          width: MediaQuery.of(context).size.width * 0.45,
          child: new Container(
            padding: EdgeInsets.all(8),
            color: Colors.lightGreen,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new SizedBox(
                  child: new Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  height: 20,
                  width: 20,
                ),
                new Container(
                  child: new Text(
                    "Sebete elave et",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          alignment: Alignment.centerRight,
        ),
        onTap: () {
          //setState(() {});
        },
      );
}
