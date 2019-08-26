import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ConversationItemAction { action, AddMessage }

class ConversationItemActionCreator {
  static Action onAction() {
    return const Action(ConversationItemAction.action);
  }

  static Action onAddMessage(message) {
    return Action(ConversationItemAction.AddMessage, payload: message);
  }
}
