import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/data.dart';
import 'package:redux_sign_in/data/viewmodel/home_viewmodel.dart';
import 'package:redux_sign_in/ui/widgets/dropdown.dart';
import 'package:redux_sign_in/ui/widgets/glistitem1.dart';
import 'package:redux_sign_in/ui/widgets/list_item/product_list_item.dart';
import 'package:redux_sign_in/ui/widgets/rating_star.dart';

class ProductListPage extends StatefulWidget {
  String title;

  ProductListPage(this.title);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ProductListPageState();
  }
}

class ProductListPageState extends State<ProductListPage> {
  int page = 0;
  List<Product> productList;
  ScrollController _scrollController;
  String message;
  HomeViewModel viewModel;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _scrollController = new ScrollController();
    _scrollController.addListener(_scrollListener);
    productList = new List();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                productList.addAll(onData.home.data);
              } catch (exceptoon) {}
              // print("//" + onData.campaign.data.toString() + "...");
            }
          });
        },
        builder: (BuildContext context, HomeViewModel viewModel) {
          // TODO: implement build
          return new Scaffold(
              key: scaffoldKey,
              appBar: new AppBar(
                backgroundColor: Colors.lightGreen,
                title: Text("Product List"),
                actions: <Widget>[
                  GestureDetector(
                    child: new Container(
                      child: Icon(Icons.sort),
                      margin: EdgeInsets.all(16),
                    ),
                    onTap: () {
                     //_showDialog();
                    },
                  ),
                  GestureDetector(
                    child: new Container(
                      child: Icon(Icons.shopping_cart),
                      margin: EdgeInsets.only(right: 8),
                    ),
                  )
                ],
              ),
              body: new CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(
                      padding: const EdgeInsets.all(8),
                      sliver: new SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            crossAxisCount: 2,
                                childAspectRatio: 0.55
                          ),
                          delegate: new SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return   Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 350,
                                child: InkWell(
                                  child: GroceryListItemOne(
                                    image: productList[index].image,
                                    subtitle: productList[index].amount.toString(),
                                    title: productList[index].title,
                                    amount: 1,
                                    price: "1 AZN",
                                    isAdded: false,
                                    isLiked: true,
                                  ),
                                ));
                          }, childCount: productList.length)))
                ],
                controller: _scrollController,
              ));
        });
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
           DropdownMenu()
          ],
        );
      },
    );
  }

  void loadMore() {
    page++;
    if (viewModel != null) {
      viewModel.onFetchProductList(10, page);
    }
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
}
/*
return DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                              items: <String>[
                                'Price:Lower to High',
                                'Price:High to Lower',
                                'Name:A-Z',
                                'Name:Z-A'
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                return Text(value);
                              },
                              hint: new Container(
                                child: new Text(
                                  "Sort By",
                                ),
                                margin: EdgeInsets.only(left: 3),
                              )));
 */