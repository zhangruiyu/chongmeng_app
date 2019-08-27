import 'package:fish_redux/fish_redux.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

enum ConversationItemAction {
  AddAllMessage,
  AddMessage,
  Refresh,
  SendTextMessage
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

  static Action onSendTextMessage() {
    return Action(ConversationItemAction.SendTextMessage);
  }
}
