import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserDetailsState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserDetailsState>>{
      UserDetailsAction.SetUserData: _onSetUserData,
    },
  );
}

UserDetailsState _onSetUserData(UserDetailsState state, Action action) {
  final UserDetailsState newState = state.clone()..data = action.payload;
  return newState;
}
