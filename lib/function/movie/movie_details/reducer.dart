import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MovieDetailsState> buildReducer() {
  return asReducer(
    <Object, Reducer<MovieDetailsState>>{
      MovieDetailsAction.SetDetailsData: _onSetDetailsData,
    },
  );
}

MovieDetailsState _onSetDetailsData(MovieDetailsState state, Action action) {
  final MovieDetailsState newState = state.clone()
    ..detailMovie = action.payload;
  return newState;
}
