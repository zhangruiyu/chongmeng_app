import 'package:fish_redux/fish_redux.dart';

import 'model/hot_movie_entity.dart';

class MovieState implements Cloneable<MovieState> {
  HotMovieData data;

  @override
  MovieState clone() {
    return MovieState()..data = data;
  }
}

MovieState initState(Map<String, dynamic> args) {
  return MovieState();
}
