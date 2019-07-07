import 'dart:convert';

import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:overlay_support/overlay_support.dart';
import 'action.dart';
import 'state.dart';

Effect<AddTallyState> buildEffect() {
  return combineEffects(<Object, Effect<AddTallyState>>{
    AddTallyAction.AddTally: _onAddTally,
  });
}

void _onAddTally(Action action, Context<AddTallyState> ctx) {
  if (ctx.state.selectId.length == 0) {
    toast(ctx.context, "最少应选择一个标签");
  } else {
    RequestClient.request(ctx.context, HttpConstants.AddTally,
        queryParameters: {
          'takeDate': ctx.state.takeDate,
          'selectId': jsonEncode(ctx.state.selectId),
          'price': ctx.state.priceTextEditingController.text,
          'remake': ctx.state.remarkTextEditingController.text,
        });
  }
}
