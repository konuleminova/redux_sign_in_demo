import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/home_model.dart';
import 'package:redux_sign_in/data/model/product_model.dart';
import 'package:redux_sign_in/redux/action/home_action.dart';

Reducer<List<Product>> homeReducer = combineReducers<List<Product>>(
    [
      TypedReducer<List<Product>, FetchProductsAction>(fetchProductsReducer),
      TypedReducer<List<Product>, AddProductAction>(addCardReducer)
    ]);


List<Product> addCardReducer(List<Product> state, AddProductAction action) {
  return []..addAll(state);
}

List<Product> fetchProductsReducer(List<Product> state,
    FetchProductsAction action) {
  return []..addAll(action.data);
}
