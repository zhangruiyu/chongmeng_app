import 'package:chongmeng/function/movie/model/hot_movie_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'model/movie_details_entity.dart';

class MovieDetailsState implements Cloneable<MovieDetailsState> {
  HotMovieDataMovielist itemMovie;
  MovieDetailsDetailmovie detailMovie;

  TabController tabController;

  @override
  MovieDetailsState clone() {
    return MovieDetailsState()
      ..tabController = tabController
      ..itemMovie = itemMovie
      ..detailMovie = detailMovie;
  }
}

MovieDetailsState initState(Map<String, dynamic> args) {
  return MovieDetailsState()..itemMovie = args['movie'];
}

class MovieDetailsPageState extends ComponentState<MovieDetailsState>
    with SingleTickerProviderStateMixin {}
