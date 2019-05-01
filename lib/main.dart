import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_sign_in/data/model/login_model.dart';
import 'package:redux_sign_in/data/viewmodel/login_viewmodel.dart';
import 'package:redux_sign_in/ui/page/grocery/grocery_details_page.dart';
import 'package:redux_sign_in/ui/page/grocery/grocery_shop_cart.dart';
import 'package:redux_sign_in/ui/page/grocery/gwishlisttab.dart';
import 'package:redux_sign_in/ui/page/payment/checkout.dart';
import 'package:redux_sign_in/ui/page/payment/confirm_order.dart';
import 'package:redux_sign_in/ui/page/map.dart';
import 'package:redux_sign_in/ui/page/test/old_test_cards.dart';
import 'package:redux_sign_in/ui/page/home.dart';
import 'package:redux_sign_in/ui/page/index.dart';
import 'package:redux_sign_in/ui/page/login.dart';
import 'package:redux_sign_in/ui/page/test/old_product_detail.dart';
import 'package:redux_sign_in/ui/page/payment/payment_method.dart';
import 'package:redux_sign_in/ui/page/register.dart';
import 'package:redux_sign_in/data/model/app_state_model.dart';
import 'package:redux/redux.dart';
import 'package:redux_sign_in/redux/reducer/app_state_reducer.dart';
import 'package:redux_sign_in/ui/page/test/old_shopping_cart.dart';
import 'package:redux_sign_in/ui/widgets/dropdown.dart';
import 'package:redux_sign_in/util/sharedpref_util.dart';
import 'package:redux_thunk/redux_thunk.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(appStateReducer,
      initialState: AppState.initialState(), middleware: [thunkMiddleware]);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        home: IndexPage(),
        routes: <String, WidgetBuilder>{
          "/index": (BuildContext context) => IndexPage(),
          "/login": (BuildContext context) => LoginPage(),
          "/register": (BuildContext context) => RegisterPage(),
          "/home": (BuildContext context) => HomePage(),
          "/shopping_cart": (BuildContext context) => GroceryShopCartPage(),
          "/product_detail": (BuildContext context) => GroceryDetailsPage(),
          "/drop_down": (BuildContext context) => DropdownMenu(),
          "/wish_list": (BuildContext context) =>   GroceryWishlistTabView(),
          "/confirm_order":(context)=>ConfirmOrderPage(),
          "/card_storage":(context)=> PaymentMethodPage(),
          "/checkout": (BuildContext context) => CheckoutsPage(),

          // "/product_list": (BuildContext context) => ProductListPage()
        },
      ),
    );
  }
}
