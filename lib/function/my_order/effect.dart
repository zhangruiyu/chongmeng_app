import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:oktoast/oktoast.dart';
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
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    ctx.dispatch(MyOrderActionCreator.onResetPageData(result.data.data));
  }
}

Future _onSkipReviewPage(Action action, Context<MyOrderState> ctx) async {
  MyOrderData virtualProduct = action.payload;
  if (virtualProduct.virtualProduct != null) {
    if (virtualProduct.virtualProduct.length > 0) {
      Navigator.pushNamed(ctx.context, PageConstants.VirtualProductReviewPage,
          arguments: {'data': virtualProduct});
    } else {
      showToast("已为您加急兑换中,下单后30分钟未兑换成功自动退货");
      ctx.dispatch(MyOrderActionCreator.onRefresh(null));
    }
  }
}
