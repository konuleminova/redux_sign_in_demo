import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state_model.dart';
import 'package:redux_sign_in/redux/middleware/thunk_campaign.dart';

class HomeViewModel {
  Function(int limit, int page) onFetchProductList;
  HomeViewModel({this.onFetchProductList});

  factory HomeViewModel.create(Store<AppState> store) {
    _onFetchProductList(int limit, int page) {
      store.dispatch(getProductListThunkAction(limit, page));
    }
    return HomeViewModel(onFetchProductList: _onFetchProductList);
  }
}
