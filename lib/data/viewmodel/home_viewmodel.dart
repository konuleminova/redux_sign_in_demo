import 'package:redux/redux.dart';
import 'package:redux_sign_in/data/model/app_state.dart';
import 'package:redux_sign_in/redux/middleware/thunk_campaign.dart';

class HomeViewModel {
  Function(int limit, int page) onFetchCampaign;
  HomeViewModel({this.onFetchCampaign});

  factory HomeViewModel.create(Store<AppState> store) {
    _onFetchCampaign(int limit, int page) {
      store.dispatch(campaignThunkAction(limit, page));
    }
    return HomeViewModel(onFetchCampaign: _onFetchCampaign);
  }
}
