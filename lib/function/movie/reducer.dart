import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MovieState> buildReducer() {
  return asReducer(
    <Object, Reducer<MovieState>>{
      MovieAction.ResetData: _onResetData,
      MovieAction.SetDistrictText: _onSetDistrictText,
    },
  );
}

MovieState _onResetData(MovieState state, Action action) {
  final MovieState newState = state.clone()..data = action.payload;
  return newState;
}

MovieState _onSetDistrictText(MovieState state, Action action) {
  final MovieState newState = state.clone()..districtText = action.payload;
  return newState;
}
