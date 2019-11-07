import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MovieSeatState> buildReducer() {
  return asReducer(
    <Object, Reducer<MovieSeatState>>{
      MovieSeatAction.SetSeatData: _onSetSeatData,
    },
  );
}

MovieSeatState _onSetSeatData(MovieSeatState state, Action action) {
  final MovieSeatState newState = state.clone()..seatEntity = action.payload;
  return newState;
}
