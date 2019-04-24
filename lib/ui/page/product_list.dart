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
                  child: DropdownButtonHideUnderline(child:  new DropdownButton<String>(
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
                    hint: new Container(child: new Text("Sort By"),margin: EdgeInsets.only(left: 3),)
                  )),
                  margin: EdgeInsets.all(16),
                   decoration: BoxDecoration(border: new Border.all(color: Colors.grey)),),
            ],
          )
        ],
      ),
    );
  }
}
