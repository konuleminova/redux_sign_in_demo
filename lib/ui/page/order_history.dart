import 'package:flutter/material.dart';
import 'package:redux_sign_in/data/model/order_history_model.dart';
import 'package:redux_sign_in/data/model/product_model.dart';
import 'package:redux_sign_in/ui/widgets/list_item/glistitem3.dart';

class OrderHistoryPage extends StatelessWidget {
  List<OrderItem> orderItems = new List();

  @override
  Widget build(BuildContext context) {
    orderItems.add(
      new OrderItem(
          title: "Order Name", subtitle: "27.02.2019", price: "1 AZN",status: true),
    );
    orderItems.add(
      new OrderItem(
          title: "Order Name", subtitle: "28.05.2019", price: "1 AZN",status: false),
    );
    orderItems.add(
      new OrderItem(title: "Order Name", subtitle: "1.02.2019", price: "1 AZN",status: false),
    );
    orderItems.add(
      new OrderItem(title: "Order Name", subtitle: "3.04.2019", price: "1 AZN",status: true),
    );
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
      body: Column(
        children: <Widget>[
          Expanded(child: _shopBody()),
          SizedBox(
            height: 10.0,
          ),
          // _buildTotals()
        ],
      ),
    );
  }

  Widget _shopBody() => new Container(
        margin: EdgeInsets.only(bottom: 16, top: 16, left: 10, right: 12),
        child: new ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: orderItems
              .map((OrderItem orderItem) => _builOrderListItem(orderItem))
              .toList(),
        ),
      );

  Widget _builOrderListItem(OrderItem orderItem) => new Stack(
        children: <Widget>[
          GroceryListItemThree(new OrderItem(
              title: orderItem.title,
              subtitle: orderItem.subtitle,
              status: orderItem.status,
              amount: 1,
              price: orderItem.price)),
        ],
      );
}
