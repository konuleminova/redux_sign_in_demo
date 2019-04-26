import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/data.dart';
import 'package:redux_sign_in/data/viewmodel/home_viewmodel.dart';
import 'package:redux_sign_in/ui/widgets/list_item/home_list_item.dart';
import 'package:redux_sign_in/ui/widgets/rating_star.dart';

class ProductListPage extends StatefulWidget {
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
                  new Container(
                    child: DropdownButtonHideUnderline(
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
                            ))),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: new Border.all(width: 1, color: Colors.white),
                    ),
                  )
                ],
              ),
              body: new CustomScrollView(slivers: <Widget>[
                SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: new SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,),
                        delegate: new SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return HomeListItemWidget(
                              _scrollController, productList, index);
                        },childCount: productList.length)))
              ],controller: _scrollController,));
        });
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
