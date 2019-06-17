import 'package:fish_redux/fish_redux.dart';

enum MainAction { ChangeNewPage }

class MainActionCreator {
  static Action onChangeNewPage(int index) {
    return Action(MainAction.ChangeNewPage, payload: index);
  }
}
