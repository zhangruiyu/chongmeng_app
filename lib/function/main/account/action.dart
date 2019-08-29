import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AccountAction { action, Refresh }

class AccountActionCreator {
  static Action onAction() {
    return const Action(AccountAction.action);
  }

  static Action onRefresh(param) {
    return Action(AccountAction.Refresh, payload: param);
  }
}
