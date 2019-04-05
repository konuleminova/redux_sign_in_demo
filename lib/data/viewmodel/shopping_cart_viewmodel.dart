import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/shop_item.dart';
import 'package:redux_sign_in/redux/action/OnShoppingCartAction.dart';

class ShoppingCartViewModel {
  Function(ShopItem shopItem) removeItem;
  List<ShopItem> shopItems;

  ShoppingCartViewModel({this.removeItem,this.shopItems});

  factory ShoppingCartViewModel.create(Store<AppState> store) {
    _removeItem(ShopItem shopItem) {
      store.dispatch(OnShoppingCartAction(removeItem: shopItem));
    }
    return ShoppingCartViewModel(removeItem: _removeItem,shopItems: store.state.shopItems);
  }
}
