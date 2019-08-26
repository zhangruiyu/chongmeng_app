import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

class ConversationItemState implements Cloneable<ConversationItemState> {
  ScrollController controller;
  JMMessageEventListener messageEventListener;
  List<JMNormalMessage> messages;
  JMConversationInfo conversationInfo;

  @override
  ConversationItemState clone() {
    return ConversationItemState()
      ..messages = messages
      ..conversationInfo = conversationInfo
      ..messageEventListener = messageEventListener
      ..controller = controller;
  }
}

ConversationItemState initState(Map<String, dynamic> args) {
  return ConversationItemState()
    ..controller = ScrollController()
    ..conversationInfo = args['conversationInfo']
    ..messages = args['messages'];
}
