import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ConversationItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ConversationItemState>>{
      ConversationItemAction.AddMessage: _onAddMessage,
      ConversationItemAction.AddAllMessage: _onAddAllMessage,
      ConversationItemAction.AddSendMessage: _onAddSendMessage,
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

ConversationItemState _onAddSendMessage(
    ConversationItemState state, Action action) {
  final ConversationItemState newState = state.clone();
  newState
    ..messages = (List.from(newState.messages)..insert(0, action.payload))
    ..sendMessages =
        (List.from(newState.sendMessages)..insert(0, action.payload));
  return newState;
}

ConversationItemState _onAddAllMessage(
    ConversationItemState state, Action action) {
  final ConversationItemState newState = state.clone();
  newState
    ..messages = (List.from(newState.messages)
      ..insertAll(newState.messages.length, action.payload));
  newState.localIndex = newState.localIndex + 1;
  return newState;
}
