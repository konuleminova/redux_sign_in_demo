import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/data.dart';
import 'package:redux_sign_in/data/model/user_login.dart';
import 'package:redux_sign_in/data/viewmodel/home_viewmodel.dart';
import 'package:redux_sign_in/data/viewmodel/login_viewmodel.dart';
import 'package:redux_sign_in/util/carousel.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Data> campaignList;
  ScrollController _scrollController, _scrollControllerSecond;
  String message;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  HomeViewModel viewModel;
  int page = 0;
  double height = 0;
  double width = 0;
  final dataKey = new GlobalKey();
  int index = 4;

  @override
  void initState() {
    campaignList = new List();
    _scrollController = new ScrollController();
    _scrollController.addListener(_scrollListener);
    _scrollControllerSecond = new ScrollController();
    _scrollControllerSecond.addListener(_scrollListenerSecond);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return StoreConnector(
        onInitialBuild: (HomeViewModel viewModel) {
          viewModel.onFetchCampaign(10, page);
          this.viewModel = viewModel;
        },
        converter: (Store<AppState> store) => HomeViewModel.create(store),
        onInit: (store) {
          store.onChange.listen((onData) {
            if (onData != null) {
              try {
                campaignList.addAll(onData.campaign.data);
              } catch (exceptoon) {}
              // print("//" + onData.campaign.data.toString() + "...");
            }
          });
        },
        builder: (BuildContext context, HomeViewModel viewModel) {
          return new Scaffold(
              key: scaffoldKey,
              appBar: new AppBar(
                backgroundColor: Colors.lightGreen,
                leading: IconButton(
                  icon: new Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () => scaffoldKey.currentState.openDrawer(),
                ),
                title: new Text("Home"),
                actions: <Widget>[
                  new IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  new IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/shopping_cart");
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ))
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
                      decoration: new BoxDecoration(color: Colors.lightGreen),
                    ),
                    ListTile(
                      leading: Icon(Icons.category),
                      title: Text("Categories"),
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
                    ListTile(
                        leading: Icon(Icons.info), title: Text("About Us")),
                    ListTile(
                        leading: Icon(Icons.phone), title: Text("Contact Us")),
                  ],
                ),
              ),
              body: new ListView(children: <Widget>[
                // _buildCarousel(),
                new SizedBox(
                  width: width,
                  height: 200,
                  child: new PageView(children: <Widget>[_buildCarousel()]),
                ),
                _titleContainer(),
                _itemList(),
                _titleContainer(),
                _itemListSecond(),
                _titleContainer()
              ]));
        });
  }

  Widget _buildCarousel() => Container(
        margin: EdgeInsets.all(16),
        child: new Carousel(
          children: [
            new AssetImage('images/img1.jpg'),
            new AssetImage('images/img2.jpg'),
            new AssetImage('images/img3.jpg'),
          ]
              .map((bgImage) => new Image(
                    image: bgImage,
                    width: width,
                    height: 200,
                    fit: BoxFit.cover,
                  ))
              .toList(),
          displayDuration: const Duration(seconds: 4),
        ),
      );

  _titleContainer() => new Container(
        margin: EdgeInsets.all(10),
        height: 60,
        color: Colors.grey[200],
        child: new Stack(
          children: <Widget>[
            new Container(
              child: new Text(
                "Popular Mehsullar ",
                textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 20),
              ),
              alignment: AlignmentDirectional.centerStart,
            ),
            new Container(
              child: new Text(
                "See All ",
                textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 15),
              ),
              alignment: AlignmentDirectional.centerEnd,
            )
          ],
        ),
      );

  _itemList() => Container(
        margin: EdgeInsets.all(8),
        child: new SizedBox(
          height: 230,
          child: Stack(
            children: <Widget>[
              new Container(
                  child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                itemBuilder: (BuildContext context, int index) => new Container(
                    width: 140,
                    child: new Card(
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ClipRect(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new SizedBox(
                                child: new Image.network(
                                  campaignList[index].image,
                                  fit: BoxFit.cover,
                                ),
                                width: 100,
                                height: 120,
                              ),
                              new Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: new Text(
                                  "Alma",
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              new Container(
                                margin: EdgeInsets.only(left: 10),
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Container(
                                      child: new Text(
                                        "1 kq",
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    new Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: new Text(
                                        "2 AZN",
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              new GestureDetector(
                                child: new Container(
                                  height: 25,
                                  margin: EdgeInsets.all(8),
                                  decoration: new BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          new BorderRadius.circular(8)),
                                  alignment: AlignmentDirectional.center,
                                  child: _updateCardWidget(
                                      campaignList[index].status),
                                ),
                                onTap: () {
                                  setState(() {
                                    campaignList[index].status = true;
                                  });
                                },
                              )
                            ],
                          ),
                        ))),
                itemCount: campaignList.length,
              )),
              new Container(
                alignment: AlignmentDirectional.centerEnd,
                child: new IconButton(
                    disabledColor: Colors.white,
                    iconSize: 40,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _scrollController.animateTo((100.0 * index),
                          // 100 is the height of container and index of 6th element is 5
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut);
                      index = index + 3;
                    }),
              )
            ],
          ),
        ),
      );

  _itemListSecond() => new Container(
        margin: EdgeInsets.all(16),
        child: new SizedBox(
          height: 150,
          child: Stack(
            children: <Widget>[
              new Container(
                  child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: _scrollControllerSecond,
                itemBuilder: (BuildContext context, int index) => new Container(
                    width: 120,
                    child: new Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRect(
                          child: new Image.network(
                            campaignList[index].image,
                            fit: BoxFit.fill,
                          ),
                        ))),
                itemCount: campaignList.length,
              )),
              new Container(
                alignment: AlignmentDirectional.centerEnd,
                child: new IconButton(
                    disabledColor: Colors.white,
                    iconSize: 40,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _scrollControllerSecond.animateTo((100.0 * index),
                          // 100 is the height of container and index of 6th element is 5
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut);
                      index = index + 3;
                    }),
              )
            ],
          ),
        ),
      );

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

  _scrollListenerSecond() {
    if (_scrollControllerSecond.offset >=
            _scrollControllerSecond.position.maxScrollExtent &&
        !_scrollControllerSecond.position.outOfRange) {
      setState(() {
        message = "reach the bottom";
        print(message);
        loadMore();
      });
    }
    if (_scrollControllerSecond.offset <=
            _scrollControllerSecond.position.minScrollExtent &&
        !_scrollControllerSecond.position.outOfRange) {
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

  _updateCardWidget(bool status) {
    if (status) {
      return new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Icon(Icons.add, color: Colors.white),
          new Text(
            "2",
            style: new TextStyle(fontSize: 18, color: Colors.white),
          ),
          new Icon(
            Icons.add,
            color: Colors.white,
          )
        ],
      );
    } else {
      return new Container(
          child: new Text(
        "Add",
        textAlign: TextAlign.center,
        style: new TextStyle(color: Colors.white, fontSize: 18),
      ));
    }
  }
}
