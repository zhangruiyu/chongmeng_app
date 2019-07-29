import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<AliItemProductState> buildEffect() {
  return combineEffects(<Object, Effect<AliItemProductState>>{
    AliItemProductAction.SkipProductDetailsPage: _onSkipProductDetailsPage,
  });
}

void _onSkipProductDetailsPage(
    Action action, Context<AliItemProductState> ctx) {
  Navigator.pushNamed(ctx.context, PageConstants.ProductDetailsPage,
      arguments: {"data": ctx.state.itemData});
}
