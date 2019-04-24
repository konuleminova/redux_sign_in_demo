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

  var increment = 1;

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
    width = MediaQuery
        .of(context)
        .size
        .width;
    height = MediaQuery
        .of(context)
        .size
        .height;
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
                    onPressed: () {
                      showSearch(
                          context: context, delegate: BuildSearchDelegate());
                    },
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

  Widget _buildCarousel() =>
      Container(
        child: new Carousel(
          children: [
            new AssetImage('images/img1.jpg'),
            new AssetImage('images/img2.jpg'),
            new AssetImage('images/img3.jpg'),
          ]
              .map((bgImage) =>
          new Image(
            image: bgImage,
            width: width,
            height: 200,
            fit: BoxFit.cover,
          ))
              .toList(),
          displayDuration: const Duration(seconds: 4),
        ),
      );

  _titleContainer() =>
      new Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 10),
        height: 60,
        color: Colors.grey[200],
        child: new Stack(
          children: <Widget>[
            new Container(
              child: new Text(
                "Popular Mehsullar ",
                textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 20, color: Colors.green),
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

  _itemList() =>
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/product_detail");
        },
        child: Container(
          margin: EdgeInsets.all(8),
          child: new SizedBox(
            height: 230,
            child: Stack(
              children: <Widget>[
                new Container(
                    child: new ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      itemBuilder: (BuildContext context, int index) =>
                      new Container(
                          width: 140,
                          height: 150,
                          child: new Card(
                              clipBehavior: Clip.hardEdge,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: ClipRect(
                                child: new Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new SizedBox(
                                      child: new Image.network(
                                        campaignList[index].image,
                                        fit: BoxFit.cover,
                                      ),
                                      height: 100,
                                    ),
                                    new Container(
                                      margin: EdgeInsets.only(top: 4),
                                      child: new Text(
                                        "Alma",
                                        style: new TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    new Container(
                                        margin:
                                        EdgeInsets.only(right: 4, left: 4),
                                        child: _updateContainer(
                                            campaignList[index].status, index)),
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
        ),
      );

  _itemListSecond() =>
      new Container(
        margin: EdgeInsets.all(16),
        child: new SizedBox(
          height: 150,
          child: Stack(
            children: <Widget>[
              new Container(
                  child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollControllerSecond,
                    itemBuilder: (BuildContext context, int index) =>
                    new Container(
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

  _updateContainer(bool status, int index) {
    if (status) {
      return Stack(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.topLeft,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Text(
                    "1 AZN",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
                new Container(
                  child: new Text(
                    "1 eded",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                new Container(
                  padding: EdgeInsets.all(2),
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
                        child: new Icon(Icons.remove),
                        onTap: () {
                          setState(() {
                            increment = increment - 1;
                            if (increment < 1) {
                              campaignList[index].status = false;
                              increment = 1;
                            }
                          });
                        },
                      ),
                      new Text(
                        increment.toString(),
                        style: new TextStyle(fontSize: 18),
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
                )
              ],
            ),
          ),
        ],
      );
    } else {
      return new Container(
        margin: EdgeInsets.only(top: 36),
        child: Stack(
          children: <Widget>[
            new Container(
              alignment: Alignment.topLeft,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Container(
                    child: new Text(
                      "1 AZN",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                  new Container(
                    child: new Text(
                      "1 eded",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            new GestureDetector(
              child: new Container(
                child: new Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.lightGreen,
                  child: new SizedBox(
                    child: new Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    height: 20,
                    width: 20,
                  ),
                ),
                alignment: Alignment.topRight,
              ),
              onTap: () {
                setState(() {
                  campaignList[index].status = true;
                });
              },
            ),
          ],
        ),
      );
    }
  }
}

class BuildSearchDelegate extends SearchDelegate<String> {
  final vegetables = [
    "apple",
    "alfalfa sprout",
    "amaranth",
    "anise",
    "artichoke",
    "arugula",
    "asparagus",
    "aubergine",
    "azuki bean",
    "banana squash",
    "basil",
    "bean sprout",
    "beet",
    "black bean",
    "black-eyed pea",
    "bok choy",
    "borlotti bean",
    "broad beans",
    "broccoflower",
    "broccoli",
    "brussels sprout",
    "butternut squash",
    "cabbage",
    "calabrese",
    "caraway",
    "carrot",
    "cauliflower",
    "cayenne pepper",
    "celeriac",
    "celery",
    "chamomile",
    "chard",
    "chayote",
    "chickpea",
    "chives",
    "cilantro",
    "collard green",
    "corn",
    "corn salad",
    "courgette",
    "cucumber",
    "daikon",
    "delicata",
    "dill",
    "eggplant",
    "endive",
    "fennel",
    "fiddlehead",
    "frisee",
    "garlic",
    "gem squash",
    "ginger",
    "green bean",
    "green pepper",
    "habanero",
    "herbs and spice",
    "horseradish",
    "hubbard squash",
    "jalapeno",
    "jerusalem artichoke",
    "jicama",
    "kale",
    "kidney bean",
    "kohlrabi",
    "lavender",
    "leek ",
    "legume",
    "lemon grass",
    "lentils",
    "lettuce",
    "lima bean",
    "mamey",
    "mangetout",
    "marjoram",
    "mung bean",
    "mushrooms",
    "mustard green",
    "navy bean",
    "nettles",
    "new zealand spinach",
    "nopale",
    "okra",
    "onion",
    "oregano",
    "paprika",
    "parsley",
    "parsnip",
    "patty pan",
    "peas",
    "pinto bean",
    "potato",
    "pumpkin",
    "radicchio",
    "radish",
    "rhubarb",
    "rosemary",
    "runner bean",
    "rutabaga",
    "sage",
    "scallion",
    "shallot",
    "skirret",
    "snap pea",
    "soy bean",
    "spaghetti squash",
    "spinach",
    "squash ",
    "sweet potato",
    "tabasco pepper",
    "taro",
    "tat soi",
    "thyme",
    "tomato",
    "topinambur",
    "tubers",
    "turnip",
    "wasabi",
    "water chestnut",
    "watercress",
    "white radish",
    "yam",
    "zucchini"
  ];
  final recentVegetables = [
    "apple",
    "banana",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return new Container(
      color: Colors.red,
      child: new Text("search result"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggesstionList = query.isEmpty
        ? recentVegetables
        : vegetables.where((p) => p.startsWith(query)).toList();
    // TODO: implement buildSuggestions
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            showResults(context);
          },
          title: new Text(suggesstionList[index]),
        );
      },
      itemCount: suggesstionList.length,
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        primaryColor: Colors.lightGreen,
        primaryIconTheme: theme.primaryIconTheme);

  }

}
