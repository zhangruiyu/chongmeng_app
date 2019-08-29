import 'package:fish_redux/fish_redux.dart';

enum AccountAction { ResetUnreadCount, Refresh }

class AccountActionCreator {
  static Action onResetUnreadCount(int count) {
    return Action(AccountAction.ResetUnreadCount, payload: count);
  }

  static Action onRefresh(param) {
    return Action(AccountAction.Refresh, payload: param);
  }
}
