import 'package:redux_sign_in/data/model/shop_item.dart';

class OnShoppingCartAction {
  List<ShopItem> shopItems;
  ShopItem removeItem;

  OnShoppingCartAction({this.shopItems,this.removeItem});
}
