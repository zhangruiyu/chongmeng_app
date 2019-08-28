import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/share/state.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:url_launcher/url_launcher.dart';
import 'action.dart';
import 'model/details_entity.dart';
import 'model/share_product_entity.dart';
import 'state.dart';

Effect<ProductDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<ProductDetailsState>>{
    Lifecycle.initState: _initState,
    ProductDetailsAction.Refresh: _onRefresh,
    ProductDetailsAction.Share: _onShare,
    ProductDetailsAction.SkipBuyPage: _onSkipBuyPage,
  });
}

Future _onRefresh(Action action, Context<ProductDetailsState> ctx) async {
  var result = await RequestClient.request<DetailsEntity>(
      ctx.context, HttpConstants.CoreProductDetailsPic, queryParameters: {
    'productId': ctx.state.itemData.productId,
    "type": ctx.state.itemData.type
  });
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    ctx.dispatch(ProductDetailsActionCreator.onSetDetailsData(result.data));
  }
}

Future _onShare(Action action, Context<ProductDetailsState> ctx) async {
  var result = await RequestClient.request<ShareProductEntity>(
      ctx.context, HttpConstants.CoreProductConvert,
      queryParameters: {
        'itemid': ctx.state.itemData.productId,
        "type": ctx.state.itemData.type
      },
      showLoadingIndicator: true);
  if (result.hasSuccess) {
    showModalBottomSheet(
        context: ctx.context,
        builder: (BuildContext context) {
          return routes.buildPage(PageConstants.SharePage, {
            "type": ShareState.text,
            "content":
                """${ctx.state.itemData.title}\n【在售价】${ctx.state.itemData.zkFinalPriceWap}元\n【券后价】${ctx.state.itemData.couponValue}元\n【下单链接】${result.data.data.clickUrl} \n----------------- \n复制这条信息，${result.data.data.tpwd}，到【手机淘宝】即可查看"""
          });
        });
  }
}

Future _onSkipBuyPage(Action action, Context<ProductDetailsState> ctx) async {
  launch(ctx.state.itemData.couponClickUrl);
}

Future _initState(Action action, Context<ProductDetailsState> ctx) async {
  _onRefresh(action, ctx);
}
