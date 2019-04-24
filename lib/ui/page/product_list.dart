import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ProductsState();
  }
}

class ProductsState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Product List"),
      ),
      body: new CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              "Meyve ve Terevez",
              style: TextStyle(color: Colors.lightGreen, fontSize: 20),
            ),
            automaticallyImplyLeading: false,
            expandedHeight: 80,
            backgroundColor: Colors.grey[200],
            actions: <Widget>[
              new Container(
                child: DropdownButtonHideUnderline(
                    child: new DropdownButton<String>(
                        items: <String>[
                          'Price:Lower to High',
                          'Price:High to Lower',
                          'Name:A-Z',
                          'Name:Z-A'
                        ].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          return Text(value);
                        },
                        hint: new Container(
                          child: new Text("Sort By"),
                          margin: EdgeInsets.only(left: 3),
                        ))),
                margin: EdgeInsets.all(16),
                decoration:
                    BoxDecoration(border: new Border.all(color: Colors.grey)),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver:new  SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.3)),
              delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return new Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.grey)),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new Container(
                        child: new Image.asset(
                          "images/img2.jpg",
                          fit: BoxFit.cover,
                        ),
                        margin: EdgeInsets.all(8),
                        width: 100,
                        height: 100,
                      ),
                      new Text(
                        "Alma",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      new Text(
                        "1 AZN",
                        style: TextStyle(fontSize: 18),
                      ),
                      new Text(
                        "1 eded",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      new Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.lightGreen,
                        child: new Row(
                          children: <Widget>[
                            Icon(
                              Icons.shopping_basket,
                              color: Colors.white,
                            ),
                            new Text(
                              "Sebete elave et",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
