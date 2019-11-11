import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MovieSeatState> buildReducer() {
  return asReducer(
    <Object, Reducer<MovieSeatState>>{
      MovieSeatAction.SetSeatData: _onSetSeatData,
      MovieSeatAction.SelectSeat: _onSelectSeat,
    },
  );
}

MovieSeatState _onSetSeatData(MovieSeatState state, Action action) {
  final MovieSeatState newState = state.clone()..seatEntity = action.payload;
  return newState;
}

MovieSeatState _onSelectSeat(MovieSeatState state, Action action) {
  final MovieSeatState newState = state.clone();
  if (newState.localSelectMovie.contains(action.payload)) {
    newState.localSelectMovie.remove(action.payload);
  } else {
    newState.localSelectMovie.add(action.payload);
  }
  return newState;
}
