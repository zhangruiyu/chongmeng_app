import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

class ConversationItemState implements Cloneable<ConversationItemState> {
  GlobalKey<AnimatedListState> listKey = new GlobalKey<AnimatedListState>();
  ScrollController controller;
  JMMessageEventListener messageEventListener;
  List<JMNormalMessage> messages;
  JMConversationInfo conversationInfo;
  int localIndex;

  @override
  ConversationItemState clone() {
    return ConversationItemState()
      ..localIndex = localIndex
      ..messages = messages
      ..listKey = listKey
      ..conversationInfo = conversationInfo
      ..messageEventListener = messageEventListener
      ..controller = controller;
  }
}

ConversationItemState initState(Map<String, dynamic> args) {
  return ConversationItemState()
    ..localIndex = 1
    ..controller = ScrollController()
    ..conversationInfo = args['conversationInfo']
    ..messages = args['messages'];
}
