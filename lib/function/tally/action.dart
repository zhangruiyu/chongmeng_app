import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TallyAction { action, SkipAddTallyPage }

class TallyActionCreator {
  static Action onAction() {
    return const Action(TallyAction.action);
  }

  static Action onSkipAddTallyPage() {
    return const Action(TallyAction.SkipAddTallyPage);
  }
}
