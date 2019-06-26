import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommitMediaAction { action }

class CommitMediaActionCreator {
  static Action onAction() {
    return const Action(CommitMediaAction.action);
  }
}
