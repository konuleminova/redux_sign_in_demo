import 'package:flutter/material.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/shop_item.dart';
import 'package:redux_sign_in/redux/action/OnFetchCampaignAction.dart';
import 'package:redux_sign_in/redux/action/OnLoginAction.dart';
import 'package:redux_sign_in/redux/action/OnRegisterAction.dart';
import 'package:redux_sign_in/redux/action/OnShoppingCartAction.dart';

AppState appStateReducer(AppState state, dynamic action) {
  if (action is OnLoginAction) {
    return AppState(user_info: action.userLogin);
  } else if (action is OnRegisterAction) {
    return AppState(userRegister: action.userRegister);
  } else if (action is OnFetchHomeAction) {
    return AppState(home: action.home);
  } else if (action is OnShoppingCartAction) {
    List<ShopItem> shopItems = new List<ShopItem>();
    shopItems.addAll(List.unmodifiable(
        List.from(state.shopItems)..remove(action.removeItem)));
    return AppState(shopItems: shopItems);
    //  return AppState(shopItems: shopItmesNew);
  }
}
