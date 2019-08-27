import 'package:fish_redux/fish_redux.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

enum ConversationItemAction {
  AddAllMessage,
  AddMessage,
  Refresh,
  SendTextMessage,
  AddSendMessage //发送的新数据 要单独记录 防止查找本地数据出现角标问题,
}

class ConversationItemActionCreator {
  static Action onAddAllMessage(List<JMNormalMessage> s) {
    return Action(ConversationItemAction.AddAllMessage, payload: s);
  }

  static Action onRefresh(Map<String, dynamic> data) {
    return Action(ConversationItemAction.Refresh, payload: data);
  }

  static Action onAddMessage(message) {
    return Action(ConversationItemAction.AddMessage, payload: message);
  }

  static Action onAddSendMessage(message) {
    return Action(ConversationItemAction.AddSendMessage, payload: message);
  }

  static Action onSendTextMessage() {
    return Action(ConversationItemAction.SendTextMessage);
  }
}
