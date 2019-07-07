import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TallyState> buildReducer() {
  return asReducer(
    <Object, Reducer<TallyState>>{
      TallyAction.action: _onAction,
    },
  );
}

TallyState _onAction(TallyState state, Action action) {
  final TallyState newState = state.clone();
  return newState;
}
