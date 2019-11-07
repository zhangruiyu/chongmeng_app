import 'package:chongmeng/function/movie/movie_cinema/model/cinema_movies_entity.dart';
import 'package:fish_redux/fish_redux.dart';

import 'model/seat_entity.dart';

class MovieSeatState implements Cloneable<MovieSeatState> {
  CinemaMoviesShowdataMoviesShowsPlist cinemaMovie;
  SeatEntity seatEntity;

  @override
  MovieSeatState clone() {
    return MovieSeatState()
      ..cinemaMovie = cinemaMovie
      ..seatEntity = seatEntity;
  }
}

MovieSeatState initState(Map<String, dynamic> args) {
  return MovieSeatState()..cinemaMovie = args['cinemaMovie'];
}
