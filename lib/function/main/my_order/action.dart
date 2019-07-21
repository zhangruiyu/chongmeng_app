import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MyOrderAction { action }

class MyOrderActionCreator {
  static Action onAction() {
    return const Action(MyOrderAction.action);
  }
}
