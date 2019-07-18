import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DynamicListAction { action }

class DynamicListActionCreator {
  static Action onAction() {
    return const Action(DynamicListAction.action);
  }
}
