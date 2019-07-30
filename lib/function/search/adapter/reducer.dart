import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchListState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchListState>>{
      SearchListAction.action: _onAction,
    },
  );
}

SearchListState _onAction(SearchListState state, Action action) {
  final SearchListState newState = state.clone();
  return newState;
}
