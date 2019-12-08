import 'package:fish_redux/fish_redux.dart';

import 'model/cinema_city_entity.dart';

class MovieCityState implements Cloneable<MovieCityState> {
  CinemaCityData data;

  @override
  MovieCityState clone() {
    return MovieCityState()..data = data;
  }
}

MovieCityState initState(Map<String, dynamic> args) {
  return MovieCityState();
}
