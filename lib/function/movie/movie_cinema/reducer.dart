import 'package:chongmeng/utils/window_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Reducer<MovieCinemaState> buildReducer() {
  return asReducer(
    <Object, Reducer<MovieCinemaState>>{
      MovieCinemaAction.ChangeMovieIndex: _onChangeMovieIndex,
      MovieCinemaAction.SetRefreshMovies: _onSetRefreshMovies,
    },
  );
}

MovieCinemaState _onChangeMovieIndex(MovieCinemaState state, Action action) {
  final MovieCinemaState newState = state.clone()..selectIndex = action.payload;
  newState.movieScrollController
      .animateTo(WindowUtils.getScreenWidth() / 5 * (action.payload),
          duration: new Duration(milliseconds: 100), // 300ms
          curve: Curves.bounceIn);
  return newState;
}

MovieCinemaState _onSetRefreshMovies(MovieCinemaState state, Action action) {
  final MovieCinemaState newState = state.clone()
    ..cinemaMovies = action.payload;
  return newState;
}
