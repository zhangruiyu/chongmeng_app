import 'package:fish_redux/fish_redux.dart';

enum GlobalAction { changeLanguage }

class GlobalActionCreator {
  static Action onchangeLanguage() {
    return const Action(GlobalAction.changeLanguage);
  }
}
