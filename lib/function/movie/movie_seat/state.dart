import 'package:chongmeng/function/movie/movie_cinema/model/cinema_movies_entity.dart';
import 'package:fish_redux/fish_redux.dart';

import 'model/seat_entity.dart';

class MovieSeatState implements Cloneable<MovieSeatState> {
  //场次信息
  CinemaMoviesShowdataMoviesShowsPlist cinemaMovie;
  //电影信息
  CinemaMoviesShowdataMovie selectCinemaMovie;
  //电影信息加影院信息
  CinemaMoviesEntity cinemaMovies;
  //座位信息
  SeatEntity seatEntity;
  //用户选择的座位
  List<SeatSeatdataSeatRegionsRowsSeat> localSelectMovie;

  @override
  MovieSeatState clone() {
    return MovieSeatState()
      ..cinemaMovies = cinemaMovies
      ..selectCinemaMovie = selectCinemaMovie
      ..localSelectMovie = localSelectMovie
      ..cinemaMovie = cinemaMovie
      ..seatEntity = seatEntity;
  }
}

MovieSeatState initState(Map<String, dynamic> args) {
  return MovieSeatState()
    ..cinemaMovies = args['cinemaMovies']
    ..selectCinemaMovie = args['selectCinemaMovie']
    ..cinemaMovie = args['cinemaMovie']
    ..localSelectMovie = [];
}
