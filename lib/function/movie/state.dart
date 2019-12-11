import 'dart:collection';

import 'package:amap_location_fluttify/src/dart/models.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'model/hot_movie_entity.dart';
import 'movie_details/model/movie_schedule_entity.dart';

class MovieState implements Cloneable<MovieState> {
  HotMovieEntity data;

  TabController tabController;
  LinkedHashMap<String, ItemMoviePageData> pageData;

  Location location;
  String districtText;

  @override
  MovieState clone() {
    return MovieState()
      ..districtText = districtText
      ..location = location
      ..data = data
      ..tabController = tabController
      ..pageData = pageData;
  }
}

MovieState initState(Map<String, dynamic> args) {
  return MovieState()
    ..pageData = LinkedHashMap.from({
      '正在热映': ItemMoviePageData(
          name: "正在热映",
          filtrateType: '正在热映',
          data: [],
          pageIndex: 0,
          easyRefreshController: EasyRefreshController()),
      '即将上映': ItemMoviePageData(
          name: "即将上映",
          filtrateType: '即将上映',
          data: [],
          pageIndex: 0,
          easyRefreshController: EasyRefreshController()),
    })
    ..districtText = "正在定位";
}

class MoviePageState extends ComponentState<MovieState>
    with SingleTickerProviderStateMixin {}

class ItemMoviePageData {
  String name;
  String filtrateType;
  int pageIndex;
  EasyRefreshController easyRefreshController;
  List<MovieScheduleCinema> data;

  ItemMoviePageData(
      {this.name,
      this.filtrateType,
      this.data,
      this.pageIndex,
      this.easyRefreshController});
}
