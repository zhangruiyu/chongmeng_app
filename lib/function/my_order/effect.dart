import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/widget/custom_dialog.dart';
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
    MyOrderAction.ShowOrderAddress: _onShowOrderAddress,
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
    if (virtualProduct.virtualProduct.isNotEmpty) {
      Navigator.pushNamed(ctx.context, PageConstants.VirtualProductReviewPage,
          arguments: {'data': virtualProduct});
    } else {
      showToast("已为您加急兑换中,下单后30分钟未兑换成功自动退货");
      ctx.dispatch(MyOrderActionCreator.onRefresh(null));
    }
  }
}

Future _onShowOrderAddress(Action action, Context<MyOrderState> ctx) async {
  MyOrderData virtualProduct = action.payload;
  showDialog(
      context: ctx.context,
      builder: (c) {
        return CanSetWidthDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(9.0),
                ),
                color: colorWhite),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text("收件人: ${virtualProduct.consigneeName}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Text("手机号: ${virtualProduct.tel}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 21.0),
                    child: Text(
                        "收货地址: ${virtualProduct.provincename + virtualProduct.cityname + virtualProduct.areaname + virtualProduct.addressDetail}"),
                  ),
                  VerticalLine(),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pop(ctx.context);
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 11),
                        child: Text(
                          "确认",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: color333333, fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
