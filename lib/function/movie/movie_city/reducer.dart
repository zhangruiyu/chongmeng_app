import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MovieCityState> buildReducer() {
  return asReducer(
    <Object, Reducer<MovieCityState>>{
      MovieCityAction.ResetData: _onResetData,
    },
  );
}

MovieCityState _onResetData(MovieCityState state, Action action) {
  final MovieCityState newState = state.clone()..data = action.payload;
  return newState;
}
