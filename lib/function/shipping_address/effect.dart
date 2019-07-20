import 'package:chongmeng/constants/page_constants.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<ShippingAddressState> buildEffect() {
  return combineEffects(<Object, Effect<ShippingAddressState>>{
    ShippingAddressAction.action: _onAction,
    ShippingAddressAction.SkipAddAddress: _onSkipAddAddress,
  });
}

void _onAction(Action action, Context<ShippingAddressState> ctx) {}

void _onSkipAddAddress(Action action, Context<ShippingAddressState> ctx) {
  Navigator.pushNamed(ctx.context, PageConstants.ShippingAddressAddPage);
}
