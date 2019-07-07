import 'package:chongmeng/constants/page_constants.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'action.dart';
import 'state.dart';

Effect<SelectSubTypeState> buildEffect() {
  return combineEffects(<Object, Effect<SelectSubTypeState>>{
    SelectSubTypeAction.SkipSelectPetAvatarPage: _onSkipSelectPetAvatarPage,
  });
}

void _onSkipSelectPetAvatarPage(
    Action action, Context<SelectSubTypeState> ctx) {
  Navigator.pushNamed(ctx.context, PageConstants.SelectPetAvatarPage,
      arguments: action.payload);
}
