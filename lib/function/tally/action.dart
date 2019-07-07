import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TallyAction { action }

class TallyActionCreator {
  static Action onAction() {
    return const Action(TallyAction.action);
  }
}
