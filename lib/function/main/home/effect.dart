import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'model/home_entity.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _onAction(Action action, Context<HomeState> ctx) {}

Future _initState(Action action, Context<HomeState> ctx) async {
  var homeData = await RequestClient.request<HomeEntity>(
      ctx.context, HttpConstants.HomeIndex);
  if (homeData.hasSuccess) {
    ctx.dispatch(HomeActionCreator.onSetHomeData(homeData.data.data));
  }
}
