import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserDetailsState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserDetailsState>>{
      UserDetailsAction.action: _onAction,
    },
  );
}

UserDetailsState _onAction(UserDetailsState state, Action action) {
  final UserDetailsState newState = state.clone();
  return newState;
}
