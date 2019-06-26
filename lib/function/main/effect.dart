import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/helper/permission_helper.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'action.dart';
import 'state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    Lifecycle.initState: _initState,
    MainAction.SkipSelectTalkTypePage: _onSkipSelectTalkTypePage,
  });
}

void _onSkipSelectTalkTypePage(Action action, Context<MainState> ctx) {
  UserHelper.loginCheck(ctx.context, () {
    Navigator.pushNamed(ctx.context, PageConstants.SelectTalkTypePage);
  });
}

Future _initState(Action action, Context<MainState> ctx) async {
//  NavigatorHelper.pusRecordPage(ctx.context);
}
