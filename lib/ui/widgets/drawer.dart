import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DrawerState();
  }
}

class DrawerState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: new Text(
              "KOnul Eminova",
              style: new TextStyle(fontSize: 20),
            ),
            accountEmail: new Text("konul.eminova@mail.sinam.net"),
            currentAccountPicture: Image.network(
                'http://www.clker.com/cliparts/5/7/4/8/13099629981030824019profile.svg.med.png'),
            decoration: new BoxDecoration(color: Colors.lightGreen),
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text("Categories"),
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text("WhishList"),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/wish_list");
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Order History"),
          ),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text("Notifications"),
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text("Feedback"),
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("FAG"),
          ),
          ListTile(leading: Icon(Icons.info), title: Text("About Us")),
          ListTile(leading: Icon(Icons.phone), title: Text("Contact Us")),
        ],
      ),
    );
  }
}
