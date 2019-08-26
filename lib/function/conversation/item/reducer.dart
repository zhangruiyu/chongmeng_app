import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ConversationItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ConversationItemState>>{
      ConversationItemAction.action: _onAction,
    },
  );
}

ConversationItemState _onAction(ConversationItemState state, Action action) {
  final ConversationItemState newState = state.clone();
  return newState;
}
