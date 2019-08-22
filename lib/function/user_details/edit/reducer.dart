import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserDetailsEditState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserDetailsEditState>>{
//      UserDetailsEditAction.action: _onAction,
    },
  );
}

UserDetailsEditState _onAction(UserDetailsEditState state, Action action) {
  final UserDetailsEditState newState = state.clone();
  return newState;
}
