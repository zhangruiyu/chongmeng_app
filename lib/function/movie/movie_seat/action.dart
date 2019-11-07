import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MovieSeatAction { action, SetSeatData }

class MovieSeatActionCreator {
  static Action onAction() {
    return const Action(MovieSeatAction.action);
  }

  static Action onSetSeatData(p) {
    return Action(MovieSeatAction.SetSeatData, payload: p);
  }
}
