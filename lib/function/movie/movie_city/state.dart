import 'package:azlistview/azlistview.dart';
import 'package:fish_redux/fish_redux.dart';

import 'model/cinema_city_entity.dart';

class MovieCityState implements Cloneable<MovieCityState> {
  String suspensionTag;

  List<CinemaCitySuspensionBean> allCity;

  List<CinemaCitySuspensionBean> hotCity;

  @override
  MovieCityState clone() {
    return MovieCityState()
      ..hotCity = hotCity
      ..allCity = allCity
      ..suspensionTag = suspensionTag;
  }
}

MovieCityState initState(Map<String, dynamic> args) {
  return MovieCityState();
}

class CinemaCitySuspensionBean extends ISuspensionBean {
  String name;
  String tagIndex;
  int id;

  String namePinyin;

  CinemaCitySuspensionBean({this.name, this.tagIndex, this.id});

  @override
  String getSuspensionTag() {
    return tagIndex;
  }
}
