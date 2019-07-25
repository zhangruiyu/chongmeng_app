import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/scheduler.dart';
import 'action.dart';
import 'model/home_entity.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.Refresh: _onRefresh,
    Lifecycle.initState: _initState,
  });
}

Future _onRefresh(Action action, Context<HomeState> ctx) async {
  var homeData = await RequestClient.request<HomeEntity>(
      ctx.context, HttpConstants.HomeIndex);
  action.payload['completer']();
  if (homeData.hasSuccess) {
    ctx.dispatch(HomeActionCreator.onSetHomeData(homeData.data.data));
  }
}

Future _initState(Action action, Context<HomeState> ctx) async {
  SchedulerBinding.instance.addPostFrameCallback((Duration timestamp) {
    ctx.state.controller.callRefresh();
  });
}
