import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DynamicListState> buildReducer() {
  return asReducer(
    <Object, Reducer<DynamicListState>>{
      DynamicListAction.action: _onAction,
    },
  );
}

DynamicListState _onAction(DynamicListState state, Action action) {
  final DynamicListState newState = state.clone();
  return newState;
}
