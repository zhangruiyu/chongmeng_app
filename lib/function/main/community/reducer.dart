import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommunityState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommunityState>>{
      CommunityAction.action: _onAction,
    },
  );
}

CommunityState _onAction(CommunityState state, Action action) {
  final CommunityState newState = state.clone();
  return newState;
}
