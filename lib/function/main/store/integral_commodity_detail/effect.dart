import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/function/shipping_address/model/shipping_address_entity.dart';
import 'package:chongmeng/function/shipping_address/state.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:overlay_support/overlay_support.dart';
import 'action.dart';
import 'state.dart';

Effect<IntegralCommodityDetailState> buildEffect() {
  return combineEffects(<Object, Effect<IntegralCommodityDetailState>>{
    IntegralCommodityDetailAction.Buy: _onBuy,
  });
}

void _onBuy(Action action, Context<IntegralCommodityDetailState> ctx) {
  UserHelper.loginCheck(ctx.context, () async {
    ShippingAddressData selectAddress = await Navigator.pushNamed<dynamic>(
        ctx.context, PageConstants.ShippingAddressPage,
        arguments: {"type": ShippingAddressState.SELECT});
    if (selectAddress != null) {
      toast(ctx.context, "弹框");
    }
  });
}
