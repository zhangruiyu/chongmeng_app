import 'package:fish_redux/fish_redux.dart';

enum MainAction { ChangeNewPage, SkipSelectTalkTypePage }

class MainActionCreator {
  static Action onChangeNewPage(int index) {
    return Action(MainAction.ChangeNewPage, payload: index);
  }

  static Action onSkipSelectTalkTypePage() {
    return Action(
      MainAction.SkipSelectTalkTypePage,
    );
  }
}
