import 'package:fish_redux/fish_redux.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

enum ConversationItemAction {
  AddAllMessage,
  AddMessage,
  Refresh,
  ActionButton, //功能按钮 发送消息或者弹起功能菜单
  AddSendMessage, //发送的新数据 要单独记录 防止查找本地数据出现角标问题,
  SetTextIsEmpty
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

  static Action onActionButton() {
    return Action(ConversationItemAction.ActionButton);
  }

  static Action onSetTextIsEmpty(bool textIsEmpty) {
    return Action(ConversationItemAction.SetTextIsEmpty, payload: textIsEmpty);
  }
}
