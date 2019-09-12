import 'package:chongmeng/helper/user_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import '../../../../routes.dart';
import 'action.dart';
import 'state.dart';

Effect<IntegralElemeItemState> buildEffect() {
  return combineEffects(<Object, Effect<IntegralElemeItemState>>{
    IntegralElemeItemAction.SkipElemeDetailPage: _onSkipElemeDetailPage,
  });
}

void _onSkipElemeDetailPage(
    Action action, Context<IntegralElemeItemState> ctx) {
  UserHelper.loginCheck(ctx.context, () {
    Navigator.pushNamed(ctx.context, PageConstants.CouponDetailPage,
        arguments: {
          "itemData": ctx.state.itemData,
          "index": ctx.state.index,
        });
  });
}
