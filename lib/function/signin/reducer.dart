import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SignInState> buildReducer() {
  return asReducer(
    <Object, Reducer<SignInState>>{
      SignInAction.action: _onAction,
    },
  );
}

SignInState _onAction(SignInState state, Action action) {
  final SignInState newState = state.clone();
  return newState;
}
