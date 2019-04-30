import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/shop_model.dart';
import 'package:redux_sign_in/redux/action/shop_action.dart';

Reducer<List<ShopItem>> shopReducer =
    combineReducers<List<ShopItem>>([
  new TypedReducer<List<ShopItem>, RemoveShopItemAction>(removeShopItemReducer)
]);

List<ShopItem> removeShopItemReducer(
    List<ShopItem> shopItems, RemoveShopItemAction action) {
  return List.unmodifiable(List.from(shopItems)..remove(action.removeShopItem));
}
