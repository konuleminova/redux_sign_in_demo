import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/home_model.dart';
import 'package:redux_sign_in/redux/action/home_action.dart';

Reducer<Home> homeReducer = combineReducers<Home>(
    [TypedReducer<Home, FetchProductsAction>(fetchProductsReducer)]);

Home fetchProductsReducer(Home state, FetchProductsAction action) {
  return state.copyWith(result: action.result, data: action.data);
}
