import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/viewmodel/shopping_cart_viewmodel.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ProductDetailState();
  }
}

class ProductDetailState extends State<ProductDetailPage> {
  var increment = 1;
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return StoreConnector(
      converter: (Store<AppState> store) => ShoppingCartViewModel.create(store),
      // onInit: (store) {},
      builder: (BuildContext context, ShoppingCartViewModel viewModel) {
        return new Scaffold(
            body: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Container(
              child: new Image(image: AssetImage('images/img3.jpg')),
            ),
            new Container(
              margin: EdgeInsets.only(left: 16),
              child: new Text(
                "Biber ",
                style: TextStyle(color: Colors.green, fontSize: 23),
              ),
            ),
            new Container(
              child: new Text(
                "2 AZN /1kq",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              margin: EdgeInsets.only(left: 16),
            ),
            new Container(
              child: new Text(
                  "Ipsum is simply dummy text of the printing and typesetting industry."),
              margin: EdgeInsets.only(left: 16),
            ),
            new Container(
              margin: EdgeInsets.only(left: 16),
              child: new Text(
                  "orem Ipsum is simply dummy text of the printing and typesetting industry."
                  " Lorem Ipsum has been the industry's standard dummy text ever since the "
                  "1500s, when an unknown printer took a galley of type and scrambled it to make a "
                  "type specimen book. It has survived not only five centuries, "),
            ),
            new Container(
              color: Colors.grey[100],
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Container(
                    width: width * 0.45,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
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
                          child: new Icon(Icons.indeterminate_check_box),
                          onTap: () {
                            setState(() {
                              if (increment > 0) {
                                increment = increment - 1;
                              }
                            });
                          },
                        ),
                        new Text(
                          increment.toString(),
                          style: new TextStyle(fontSize: 16),
                        ),
                        new GestureDetector(
                          child: new Icon(Icons.add),
                          onTap: () {
                            setState(() {
                              increment = increment + 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  new GestureDetector(
                    child: new Container(
                      width: width * 0.45,
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                      alignment: Alignment.topRight,
                    ),
                    onTap: () {
                      setState(() {});
                    },
                  )
                ],
              ),
            )
          ],
        ));
      },
    );
  }
}
