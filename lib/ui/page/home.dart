import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state_model.dart';
import 'package:redux_sign_in/data/model/product_model.dart';
import 'package:redux_sign_in/data/model/shop_model.dart';
import 'package:redux_sign_in/data/viewmodel/home_viewmodel.dart';
import 'package:redux_sign_in/ui/page/old_test_cards.dart';
import 'package:redux_sign_in/ui/page/grocery_list.dart';
import 'package:redux_sign_in/ui/widgets/drawer.dart';
import 'package:redux_sign_in/ui/widgets/list_item/glistitem1.dart';
import 'package:redux_sign_in/ui/widgets/list_item/old_product_list_item.dart';
import 'package:redux_sign_in/ui/widgets/rating_star.dart';
import 'package:redux_sign_in/ui/widgets/search.dart';
import 'package:redux_sign_in/util/carousel.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Product> productList;
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
    productList = new List();
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
          viewModel.onFetchProductList(10, page);
          this.viewModel = viewModel;
        },
        converter: (Store<AppState> store) => HomeViewModel.create(store),
        onInit: (store) {
          store.onChange.listen((onData) {
            if (onData != null) {
              try {
                productList.addAll(onData.products);
                //onData.home.data=productList;
               // productList[0].status=true;
             /*   for(int i=0;i<productList.length;i++){

                  if (productList[i].status) {
                    onData.shopItems.add(new ShopItem(
                        title: productList[i].title,
                        description: "Dummy Text",
                        price: "2 Azn"));
                  }
                }
                */

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
                      showSearch(context: context, delegate: SearchWidget());
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
              floatingActionButton: new FloatingActionButton(
                backgroundColor: Colors.lightGreen,
                onPressed: null,
                child: new Icon(Icons.chat),
              ),
              drawer: DrawerWidget(),
              body: new ListView(children: <Widget>[
                // _buildCarousel(),
                new SizedBox(
                  width: width,
                  height: 200,
                  child: new PageView(children: <Widget>[_buildCarousel()]),
                ),
                GestureDetector(
                  child: _titleContainer(),
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => GroceryListPage("titile"));
                    return Navigator.push(context, route);
                  },
                ),
                _buildCard(),
                GestureDetector(
                  child: _titleContainer(),
                ),
               // _buildCard()
              ]));
        });
  }

  Widget _buildCarousel() => Container(
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
      viewModel.onFetchProductList(10, page);
    }
  }

  _buildCard() => new Container(
        padding: EdgeInsets.all(8.0),
        child: new ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                width: width * 0.48,
                height: 350,
                child: InkWell(
                  child: GroceryListItemOne(
                    product: productList[index],viewModel: viewModel,
                  ),
                ));
          },
          itemCount: productList.length,
        ),
        width: width,
        height: 340,
      );
}
//Search Widget
