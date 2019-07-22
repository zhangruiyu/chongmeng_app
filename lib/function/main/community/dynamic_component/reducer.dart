import 'package:chongmeng/global_store/store.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DynamicItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<DynamicItemState>>{
      DynamicItemAction.ResetLiked: _onResetLiked,
    },
  );
}

DynamicItemState _onResetLiked(DynamicItemState state, Action action) {
  final DynamicItemState newState = state.clone();
  newState.data.liked = action.payload;
  return newState;
}
