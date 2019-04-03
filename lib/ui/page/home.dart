import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/data.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/data/viewmodel/fetch_campaign_viewmodel.dart';
import 'package:redux_sign_in/data/viewmodel/login_viewmodel.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Data> campaignList;
  ScrollController _scrollController;
  String message;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  FetchDataViewModel viewModel;
  int page = 0;

  @override
  void initState() {
    campaignList = new List();
    _scrollController = new ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreConnector(
        onInitialBuild: (FetchDataViewModel viewModel) {
          viewModel.onFetchCampaign(10, page);
          this.viewModel = viewModel;
        },
        converter: (Store<AppState> store) => FetchDataViewModel.create(store),
        onInit: (store) {
          store.onChange.listen((onData) {
            if (onData != null) {
              campaignList.addAll(onData.campaign.data);
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
                    //return viewModel.onFetchCampaign(10, 0);
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
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) => new Container(
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

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        message = "reach the bottom";
        print(message);
        loadMore();
      });
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        message = "reach the top";
        print(message);
      });
    }
  }

  void loadMore() {
    page++;
    if (viewModel != null) {
      viewModel.onFetchCampaign(10, page);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
