import 'package:chongmeng/function/main/community/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommunityState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommunityState>>{
      CommunityItemAction.action: _onAction,
    },
  );
}

CommunityState _onAction(CommunityState state, Action action) {
  final CommunityState newState = state.clone();
  return newState;
}
