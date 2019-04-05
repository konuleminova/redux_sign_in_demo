import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/shop_item.dart';
import 'package:redux_sign_in/redux/action/OnShoppingCartAction.dart';

class ShoppingCartViewModel {
  Function(ShopItem shopItem) deleteItem;
  List<ShopItem> shopItems;

  ShoppingCartViewModel({this.deleteItem,this.shopItems});

  factory ShoppingCartViewModel.create(Store<AppState> store) {
    _deleteItem(ShopItem shopItem) {
      store.dispatch(OnShoppingCartAction(removeItem: shopItem));
    }
    return ShoppingCartViewModel(deleteItem: _deleteItem,shopItems: store.state.shopItems);
  }
}
