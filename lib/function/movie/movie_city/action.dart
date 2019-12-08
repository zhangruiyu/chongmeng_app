import 'package:chongmeng/function/movie/movie_city/model/cinema_city_entity.dart';
import 'package:fish_redux/fish_redux.dart';

enum MovieCityAction { ResetData, Refresh }

class MovieCityActionCreator {
  static Action onRefresh(p) {
    return Action(MovieCityAction.Refresh, payload: p);
  }

  static Action onResetData(CinemaCityData data) {
    return Action(MovieCityAction.ResetData, payload: data);
  }
}
