import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/network/outermost_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'action.dart';
import 'model/dynamic_list_entity.dart';
import 'state.dart';

Effect<CommunityState> buildEffect() {
  return combineEffects(<Object, Effect<CommunityState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    CommunityAction.Refresh: _onRefresh,
  });
}

void _initState(Action action, Context<CommunityState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as CommunityPageState;
  println("initstate: ${ctx.state.runtimeType}");
  ctx.state
    ..tabController = new TabController(
        vsync: tickerProvider,
        length: ctx.state.pageData.length,
        initialIndex: 0);
}

void _dispose(Action action, Context<CommunityState> ctx) {
  ctx.state.tabController.dispose();
}

Future _onRefresh(Action action, Context<CommunityState> ctx) async {
  var result = await RequestClient.request<DynamicListEntity>(
    ctx.context,
    HttpConstants.DynamicList,
    queryParameters: {
      'filtrateType': action.payload['filtrateType'],
      "pageSize": 5,
      "pageIndex": 0
    },
  );
  action.payload['completer']();
  if (result.hasSuccess) {
    result.data;
  }
}

void _onAction(Action action, Context<CommunityState> ctx) {}
