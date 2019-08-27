import 'dart:async';

import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:chongmeng/utils/jmessage_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'action.dart';
import 'state.dart';

Effect<ConversationState> buildEffect() {
  return combineEffects(<Object, Effect<ConversationState>>{
    ConversationAction.SkipConversationItemPage: _onSkipConversationItemPage,
    Lifecycle.initState: _initState,
  });
}

Future _initState(Action action, Context<ConversationState> ctx) async {
  List<JMConversationInfo> conversations = await jmessage.getConversations();
  ctx.dispatch(ConversationActionCreator.onReSetConversations(conversations));
}

Future _onSkipConversationItemPage(
    Action action, Context<ConversationState> ctx) async {
  JMConversationInfo jmConversationInfo = action.payload;
  await NavigatorHelper.skipConversationItemPage(
      ctx.context, jmConversationInfo);
  //设置已读
  await JMessageUtils.resetUnreadMessageCount(jmConversationInfo.target);
  _initState(action, ctx);
}
