import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/function/pet/selectsubtype/model/pet_sub_type_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'action.dart';
import 'state.dart';

Effect<SelectTypeState> buildEffect() {
  return combineEffects(<Object, Effect<SelectTypeState>>{
    SelectTypeAction.SkipSelectSubTypePage: _onSkipSelectSubTypePage,
  });
}

Future _onSkipSelectSubTypePage(
    Action action, Context<SelectTypeState> ctx) async {
  var result = await RequestClient.request<PetSubTypeEntity>(
      ctx.context, HttpConstants.PetSubType,
      queryParameters: {'type': action.payload});
  if (result.hasSuccess) {
    Navigator.pushNamed(ctx.context, PageConstants.SelectSubTypePage,
        arguments: {'id': action.payload, 'subtype': result.data.data});
  }
}
