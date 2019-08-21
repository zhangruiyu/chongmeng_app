import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ItemBodyState> buildReducer() {
  return asReducer(
    <Object, Reducer<ItemBodyState>>{
      ItemBodyAction.action: _onAction,
    },
  );
}

ItemBodyState _onAction(ItemBodyState state, Action action) {
  final ItemBodyState newState = state.clone();
  return newState;
}
