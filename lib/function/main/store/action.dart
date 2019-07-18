import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum StoreAction { action }

class StoreActionCreator {
  static Action onAction() {
    return const Action(StoreAction.action);
  }
}
