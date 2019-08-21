import 'package:chongmeng/function/main/community/item_body/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';

Reducer<ItemBodyState> buildReducer() {
  return asReducer(
    <Object, Reducer<ItemBodyState>>{
      DynamicListAction.action: _onAction,
    },
  );
}

ItemBodyState _onAction(ItemBodyState state, Action action) {
  final ItemBodyState newState = state.clone();
  return newState;
}
