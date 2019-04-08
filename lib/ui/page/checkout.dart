import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CheckoutState();
  }
}

class CheckoutState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Checkout"),
      ),body: new Container(color: Colors.lightGreenAccent,),
    );
  }
}
