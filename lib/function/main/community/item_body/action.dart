import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ItemBodyAction { action }

class ItemBodyActionCreator {
  static Action onAction() {
    return const Action(ItemBodyAction.action);
  }
}
