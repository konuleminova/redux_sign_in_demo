import 'package:redux_sign_in/data/model/shop_model.dart';

class RemoveShopItemAction {
  List<ShopItem> shopItems;
  ShopItem removeShopItem;

  RemoveShopItemAction({this.shopItems,this.removeShopItem});
}
