import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SafeCenterState> buildReducer() {
  return asReducer(
    <Object, Reducer<SafeCenterState>>{
      SafeCenterAction.action: _onAction,
    },
  );
}

SafeCenterState _onAction(SafeCenterState state, Action action) {
  final SafeCenterState newState = state.clone();
  return newState;
}
