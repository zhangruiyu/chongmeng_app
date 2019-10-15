import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'action.dart';
import 'model/coupon_entity.dart';
import 'state.dart';

Effect<CouponDetailState> buildEffect() {
  return combineEffects(<Object, Effect<CouponDetailState>>{
    CouponDetailAction.GetCoupon: _onGetCoupon,
    CouponDetailAction.OpenEleme: _onOpenEleme,
  });
}

Future _onOpenEleme(Action action, Context<CouponDetailState> ctx) async {
  launch("eleme://");
}

Future _onGetCoupon(Action action, Context<CouponDetailState> ctx) async {
  if (int.tryParse(ctx.state.telEditingController.text) == null) {
    showToast('手机号格式不正确');
  } else {
    GlobalStore.store
        .getState()
        .sp
        .setString('couponTel', ctx.state.telEditingController.text);
    var itemType = ctx.state.itemData.types[ctx.state.position];
    //说明需要验证码
    var params = {};
//    println("1231321312");
//    println(ctx.state.positionType);
//    println(ctx.state.positionTypeData);
    if (itemType.type == ctx.state.positionType &&
        ctx.state.positionTypeData != null) {
      params['validateCode'] = ctx.state.codeEditingController.text;
      params['validateToken'] = ctx.state.positionTypeData;
    }
    (await RequestClient.request<CouponEntity>(ctx.context, HttpConstants.Elema,
            queryParameters: {
              'phone': ctx.state.telEditingController.text,
              'type': itemType.type,
              ...params
            },
            showLoadingIndicator: true))
        .yes((value) {
      ctx.dispatch(CouponDetailActionCreator.onSetCoupon(value.data));
    }).no((err) async {
      if (err.code == ErrorCode.RECHARGE) {
        Navigator.pushNamed(ctx.context, PageConstants.RechargePage);
      } else if (err.code == ErrorCode.ELEME_GET_CODE) {
        ctx.state.positionTypeData = err.errorData;
        ctx.state.positionType = itemType.type;
        ctx.dispatch(CouponDetailActionCreator.onElemeCode(itemType.type));
        ctx.state.codeFocusNode.requestFocus();
      }
    });
  }
}
