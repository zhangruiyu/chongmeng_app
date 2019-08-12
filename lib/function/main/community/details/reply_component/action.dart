import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ReplyAction { action }

class ReplyActionCreator {
  static Action onAction() {
    return const Action(ReplyAction.action);
  }
}
