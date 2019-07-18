import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DynamicItemAction { action }

class DynamicItemActionCreator {
  static Action onAction() {
    return const Action(DynamicItemAction.action);
  }
}
