import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:chongmeng/function/movie/movie_list/state.dart'
    as MovieListState;
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'model/hot_movie_entity.dart';

class MovieState implements Cloneable<MovieState> {
  int pageIndex;
  Location location;
  String districtText;
  List<Widget> views;
  MovieListState.MovieListState movieListState;

  @override
  MovieState clone() {
    return MovieState()
      ..movieListState = movieListState
      ..views = views
      ..pageIndex = pageIndex
      ..districtText = districtText
      ..location = location;
  }
}

MovieState initState(Map<String, dynamic> args) {
  return MovieState()
    ..movieListState = MovieListState.initState(args)
    ..districtText = "正在定位"
    ..pageIndex = 0;
}

ConnOp<MovieState, MovieListState.MovieListState> moveListConnector() {
  return ConnOp<MovieState, MovieListState.MovieListState>(
    get: (MovieState state) {
      return state.movieListState.clone();
    },
    set: (MovieState state, MovieListState.MovieListState subState) {
      state.movieListState = subState.clone();
    },
  );
}
