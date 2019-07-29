import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchState>>{
      SearchAction.ResetData: _onResetData,
    },
  );
}

SearchState _onResetData(SearchState state, Action action) {
  final SearchState newState = state.clone()..data = action.payload;
  return newState;
}
