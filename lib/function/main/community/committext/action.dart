import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommitTextAction { action }

class CommitTextActionCreator {
  static Action onAction() {
    return const Action(CommitTextAction.action);
  }
}
