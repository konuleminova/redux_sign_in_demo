import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightGreen,
        title: new Text("Order History"),
        actions: <Widget>[
          new Container(
            child: new Icon(Icons.filter_list),
            margin: EdgeInsets.only(right: 8),
          ),
          new Container(
            child: new Icon(Icons.more_vert),
            margin: EdgeInsets.only(right: 8),
          ),
        ],
      ),
    );
  }
}
