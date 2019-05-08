import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.lightGreen,
            child: ListView(
              children: <Widget>[
                new Container(
                  child: Text("Register",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0)),
                  margin: EdgeInsets.only(top: 16),
                ),
                _buildLoginForm(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Do you have an account?"),
                          FlatButton(
                            child: Text("Sign in"),
                            textColor: Colors.indigo,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildLoginForm() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              height: 380,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        style: TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                            hintText: "Email address",
                            hintStyle: TextStyle(color: Colors.blue.shade200),
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            )),
                      )),
                  Container(
                    child: Divider(
                      color: Colors.blue.shade400,
                    ),
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        style: TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: TextStyle(color: Colors.blue.shade200),
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.phone,
                              color: Colors.blue,
                            )),
                      )),
                  Container(
                    child: Divider(
                      color: Colors.blue.shade400,
                    ),
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        style: TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.blue.shade200),
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            )),
                      )),
                  Container(
                    child: Divider(
                      color: Colors.blue.shade400,
                    ),
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        style: TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                            hintText: "Confirm password",
                            hintStyle: TextStyle(color: Colors.blue.shade200),
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            )),
                      )),
                  Container(
                    child: Divider(
                      color: Colors.blue.shade400,
                    ),
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 420,
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              color: Colors.green[700],
              onPressed: () {},
              elevation: 11,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(40.0))),
              child: Text("Sign Up",
                style: TextStyle(color: Colors.white70),),

            ),alignment: AlignmentDirectional.bottomCenter,
          )
        ],
      ),
    );
  }
}
