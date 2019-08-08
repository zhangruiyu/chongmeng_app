import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchFiltrateState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchFiltrateState>>{
      SearchFiltrateAction.action: _onAction,
    },
  );
}

SearchFiltrateState _onAction(SearchFiltrateState state, Action action) {
  final SearchFiltrateState newState = state.clone();
  return newState;
}
