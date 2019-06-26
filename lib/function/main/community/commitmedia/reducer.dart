import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommitMediaState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommitMediaState>>{
      CommitMediaAction.action: _onAction,
    },
  );
}

CommitMediaState _onAction(CommitMediaState state, Action action) {
  final CommitMediaState newState = state.clone();
  return newState;
}
