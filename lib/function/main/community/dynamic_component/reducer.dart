import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DynamicItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<DynamicItemState>>{
      DynamicItemAction.action: _onAction,
    },
  );
}

DynamicItemState _onAction(DynamicItemState state, Action action) {
  final DynamicItemState newState = state.clone();
  return newState;
}
