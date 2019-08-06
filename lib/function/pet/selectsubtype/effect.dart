import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<SelectSubTypeState> buildEffect() {
  return combineEffects(<Object, Effect<SelectSubTypeState>>{
    SelectSubTypeAction.SkipSelectPetAvatarPage: _onSkipSelectPetAvatarPage,
  });
}

void _onSkipSelectPetAvatarPage(
    Action action, Context<SelectSubTypeState> ctx) {
//  Navigator.pushNamed(ctx.context, PageConstants.SelectPetAvatarPage,
//      arguments: action.payload);
}
