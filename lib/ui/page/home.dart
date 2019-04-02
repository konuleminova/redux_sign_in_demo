import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/data.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/data/viewmodel/fetch_campaign_viewmodel.dart';
import 'package:redux_sign_in/data/viewmodel/login_viewmodel.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Data> campaignList = new List();
    // TODO: implement build
    return StoreConnector(
        converter: (Store<AppState> store) => FetchDataViewModel.create(store),
        onInit: (store) {
          store.onChange.listen((onData) {
            if (onData != null) {
              campaignList = onData.campaign.data;
              print("//" + onData.campaign.data.toString() + "...");
            }
          });
        },
        builder: (BuildContext context, FetchDataViewModel viewModel) {
          return new Scaffold(
            key: scaffoldKey,
            appBar: new AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: new Icon(
                  Icons.menu,
                  color: Colors.grey,
                ),
                onPressed: () => scaffoldKey.currentState.openDrawer(),
              ),
              title: new Text("Home"),
              actions: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    return viewModel.onFetchCampaign(10, 0);
                    //  print(viewModel.onFetchCampaign(1, 10).toString());
                  },
                ),
                new IconButton(icon: Icon(Icons.shopping_cart))
              ],
            ),
            drawer: new Drawer(
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
                  ),
                  ListTile(
                    leading: Icon(Icons.category),
                    title: Text("Categories"),
                  )
                ],
              ),
            ),
            body: new Container(
                child: new ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      new Container(
                        margin: EdgeInsets.all(16),
                        child: new Image.network(
                          campaignList[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                  itemCount: campaignList.length,
                )),
          );
        });
  }
}
