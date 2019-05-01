import 'package:flutter/material.dart';
import 'package:redux_sign_in/ui/page/payment1/screens/blank_screen.dart';
import 'dart:ui';

import 'package:redux_sign_in/ui/page/payment1/widgets/pinnned_modal_sheet.dart';

class PaymentOneScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentOneScreenState();
}

class _PaymentOneScreenState extends State<PaymentOneScreen>
    with SingleTickerProviderStateMixin<PaymentOneScreen> {
  AnimationController _controller;
  int _currentIndex = 0;
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _controller = BottomSheet.createAnimationController(this);
  }

  bool closed = true;
  List<String> options = ["Online Odenis", "", "Yerinde Odenish"];

  void pop() {
    if (_navigatorKey.currentState.canPop()) {
      _navigatorKey.currentState.pop();
      return;
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        pop();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                pop();
              }),
          title: Text("Payment"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        body: PinnedModalSheet(
          initialExpanded: false,
          onExpanded: () {
            setState(() {
              print("Expanded");
              this.closed = false;
            });
          },
          header: BottomAppBar(
              child: Row(
            children: List.generate(options.length, (index) {
              if (index == 1) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.asset(
                    "images/img1.jpg",
                    width: 60.0,
                    height: 60.0,
                  ),
                );
              }
              return Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () {
                    _controller.forward();
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          border: index == _currentIndex
                              ? Border(
                                  bottom: BorderSide(
                                      color: Colors.green, width: 3.0))
                              : Border()),
                      child: Text(
                        options[index],
                        style: TextStyle(
                            inherit: true,
                            fontSize: 16.0,
                            fontWeight: index == _currentIndex
                                ? FontWeight.bold
                                : FontWeight.w300),
                      )),
                ),
              );
            }),
          )),
          bottomSheet: BottomSheet(
            onClosing: () {
              print("Closed");
              setState(() {
                closed = true;
              });
            },
            builder: (context) {
              return Container(
                  margin: EdgeInsets.only(left: 30),
                  alignment: Alignment.topLeft,
                  height: 280.0,
                  child: new Row(
                    children: <Widget>[
                      Wrap(
                        children: createMenu(),
                        spacing: 8.0,
                        runSpacing: 4.0,
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                      ),
                      Wrap(
                        children: createMenu2(),
                        spacing: 8.0,
                        runSpacing: 4.0,
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                      ),
                    ],
                  ));
            },
            animationController: _controller,
          ),
        ),
      ),
    );
  }

  void openScreen(String option) {
    _controller.value = 0.0;
    _navigatorKey.currentState
        .push(MaterialPageRoute(builder: (context) => BlankScreen(option)));
  }

  List<Widget> createMenu() {
    return [
      "11:30-13:00",
      "19:30-21:00",
      "Tecili Catdirilma",
      "Magazadan gotur"
    ]
        .map((option) => FlatButton(
              onPressed: () {
                openScreen(option);
              },
              child: Text(
                option,
                style: Theme.of(context).textTheme.title,
              ),
            ))
        .toList();
  }
  List<Widget> createMenu2() {
    return [
      "-",
      "-",
      "2 AZN ",
      "-"
    ]
        .map((option) => FlatButton(
      onPressed: () {
        openScreen(option);
      },
      child: Text(
        option,
        style: Theme.of(context).textTheme.title,
      ),
    ))
        .toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
