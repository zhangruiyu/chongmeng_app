import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

class ConversationItemState implements Cloneable<ConversationItemState> {
  GlobalKey<AnimatedListState> listKey = new GlobalKey<AnimatedListState>();
  ScrollController controller;
  TextEditingController messagesTextEditingController;
  JMMessageEventListener messageEventListener;
  List<JMNormalMessage> messages;
  //自己发送的messgae
  List<JMNormalMessage> sendMessages;
  JMConversationInfo conversationInfo;

  //本地消息行数
  int localIndex;

  @override
  ConversationItemState clone() {
    return ConversationItemState()
      ..sendMessages = sendMessages
      ..localIndex = localIndex
      ..messagesTextEditingController = messagesTextEditingController
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
    ..sendMessages = []
    ..messagesTextEditingController = TextEditingController()
    ..controller = ScrollController()
    ..conversationInfo = args['conversationInfo']
    ..messages = args['messages'];
}
