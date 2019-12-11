import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'model/hot_movie_entity.dart';

class MovieState implements Cloneable<MovieState> {
  HotMovieEntity data;
  Location location;
  String districtText;

  @override
  MovieState clone() {
    return MovieState()
      ..districtText = districtText
      ..location = location
      ..data = data;
  }
}

MovieState initState(Map<String, dynamic> args) {
  return MovieState()..districtText = "正在定位";
}

class MoviePageState extends ComponentState<MovieState>
    with SingleTickerProviderStateMixin {}
