import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'model/movie_schedule_entity.dart';
import 'state.dart';

Reducer<MovieDetailsState> buildReducer() {
  return asReducer(
    <Object, Reducer<MovieDetailsState>>{
      MovieDetailsAction.SetDetailsData: _onSetDetailsData,
      MovieDetailsAction.SetScheduleData: _onSetScheduleData,
    },
  );
}

MovieDetailsState _onSetDetailsData(MovieDetailsState state, Action action) {
  final MovieDetailsState newState = state.clone()
    ..detailMovie = action.payload;
  return newState;
}

MovieDetailsState _onSetScheduleData(MovieDetailsState state, Action action) {
  final MovieDetailsState newState = state.clone();
  newState.pageData[action.payload['key']]
    ..data = (action.payload['data'] as MovieScheduleEntity).cinemas
    ..pageIndex = 0;
  return newState;
}
