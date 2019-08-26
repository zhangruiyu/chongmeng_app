import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ConversationItemAction { action }

class ConversationItemActionCreator {
  static Action onAction() {
    return const Action(ConversationItemAction.action);
  }
}
