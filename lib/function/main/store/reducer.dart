import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<StoreState> buildReducer() {
  return asReducer(
    <Object, Reducer<StoreState>>{
      StoreAction.action: _onAction,
    },
  );
}

StoreState _onAction(StoreState state, Action action) {
  final StoreState newState = state.clone();
  return newState;
}
