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
    Lifecycle.dispose: _dispose,
  });
}

Future _initState(Action action, Context<ConversationState> ctx) async {
  List<JMConversationInfo> conversations = await jmessage.getConversations();
  ctx.dispatch(ConversationActionCreator.onReSetConversations(conversations));

  //message 和 retractedMessage 可能是 JMTextMessage | JMVoiceMessage | JMImageMessage | JMFileMessage | JMEventMessage | JMCustomMessage;
  ctx.state.messageEventListener = (msg) async {
    List<JMConversationInfo> conversations = await jmessage.getConversations();
    ctx.dispatch(ConversationActionCreator.onReSetConversations(conversations));
  };
  jmessage.addReceiveMessageListener(ctx.state.messageEventListener);
}

Future _dispose(Action action, Context<ConversationState> ctx) async {
  //移除监听
  jmessage.removeReceiveMessageListener(ctx.state.messageEventListener);
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
