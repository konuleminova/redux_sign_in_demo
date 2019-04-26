import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/data/model/home.dart';
import 'package:redux_sign_in/redux/action/OnFetchCampaignAction.dart';
import 'package:redux_sign_in/service/networks.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';

ThunkAction<AppState> campaignThunkAction(int limit, int page) {
  return (Store<AppState> store) async {
    Home response = await Networks.fetchProducts(limit, page);
    if (response != null) {
      store.state.campaign=response;
      store.dispatch(OnFetchCampaignAction(campaign: response));
    }
  };
}