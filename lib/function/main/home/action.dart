import 'package:fish_redux/fish_redux.dart';

enum HomeAction { action, SetHomeData }

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action onSetHomeData(data) {
    return Action(HomeAction.SetHomeData, payload: data);
  }
}
