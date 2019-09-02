import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SafeCenterAction { action }

class SafeCenterActionCreator {
  static Action onAction() {
    return const Action(SafeCenterAction.action);
  }
}
