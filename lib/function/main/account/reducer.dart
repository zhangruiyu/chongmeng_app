import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AccountState> buildReducer() {
  return asReducer(
    <Object, Reducer<AccountState>>{
      AccountAction.ResetUnreadCount: _onResetUnreadCount,
    },
  );
}

AccountState _onResetUnreadCount(AccountState state, Action action) {
  final AccountState newState = state.clone()..allUnreadCount = action.payload;
  return newState;
}
