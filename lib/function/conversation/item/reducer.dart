import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ConversationItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ConversationItemState>>{
      ConversationItemAction.AddMessage: _onAddMessage,
    },
  );
}

ConversationItemState _onAddMessage(
    ConversationItemState state, Action action) {
  final ConversationItemState newState = state.clone();
  newState
    ..messages = (List.from(newState.messages)..insert(0, action.payload));
  return newState;
}
