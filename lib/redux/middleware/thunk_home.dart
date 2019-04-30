import 'package:redux_sign_in/data/model/app_state_model.dart';
import 'package:redux_sign_in/data/model/home_model.dart';
import 'package:redux_sign_in/redux/action/home_action.dart';
import 'package:redux_sign_in/service/networks.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';

ThunkAction<AppState> getProductListThunkAction(int limit, int page) {
  return (Store<AppState> store) async {
    Home response = await Networks.fetchProducts(limit, page);
    if (response != null) {
      store.state.home=response;
      store.dispatch(FetchProductsAction(home: response));
    }
  };
}