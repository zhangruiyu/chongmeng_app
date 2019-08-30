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
  bool textIsEmpty;
  //底部展示
  String bottomAction;
  //本地消息行数
  int localIndex;

  @override
  ConversationItemState clone() {
    return ConversationItemState()
      ..bottomAction = bottomAction
      ..textIsEmpty = textIsEmpty
      ..sendMessages = sendMessages
      ..localIndex = localIndex
      ..messagesTextEditingController = messagesTextEditingController
      ..messages = messages
      ..listKey = listKey
      ..conversationInfo = conversationInfo
      ..messageEventListener = messageEventListener
      ..controller = controller;
  }

  static final action = "action";
  static final emoji = "emoji";
  static final normal = "normal";
}

ConversationItemState initState(Map<String, dynamic> args) {
  return ConversationItemState()
    ..bottomAction = ConversationItemState.normal
    ..textIsEmpty = true
    ..localIndex = 1
    ..sendMessages = []
    ..messagesTextEditingController = TextEditingController()
    ..controller = ScrollController()
    ..conversationInfo = args['conversationInfo']
    ..messages = args['messages'];
}
