import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'model/my_order_entity.dart';
import 'state.dart';

Effect<MyOrderState> buildEffect() {
  return combineEffects(<Object, Effect<MyOrderState>>{
    MyOrderAction.Refresh: _onRefresh,
    MyOrderAction.SkipReviewPage: _onSkipReviewPage,
  });
}

Future _onRefresh(Action action, Context<MyOrderState> ctx) async {
  var result = await RequestClient.request<MyOrderEntity>(
      ctx.context, HttpConstants.IntegralOrderList);
  action.payload['completer']();
  if (result.hasSuccess) {
    ctx.dispatch(MyOrderActionCreator.onResetPageData(result.data.data));
  }
}

Future _onSkipReviewPage(Action action, Context<MyOrderState> ctx) async {
  MyOrderData virtualProduct = action.payload;
  Navigator.pushNamed(ctx.context, PageConstants.VirtualProductReviewPage,
      arguments: {'data': virtualProduct});
}
