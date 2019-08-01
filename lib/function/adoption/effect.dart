import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AdoptionState> buildEffect() {
  return combineEffects(<Object, Effect<AdoptionState>>{
    AdoptionAction.Refresh: _onRefresh,
  });
}

Future _onRefresh(Action action, Context<AdoptionState> ctx) async {
  var result = await RequestClient.request<HomeEntity>(
      ctx.context, HttpConstants.HomeIndex);
  action.payload['completer']();
  if (result.hasSuccess) {
    ctx.dispatch(AdoptionActionCreator.onResetData(result.data.data));
  }
}
