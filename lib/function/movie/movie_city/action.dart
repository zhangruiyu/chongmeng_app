import 'package:chongmeng/function/movie/movie_city/model/cinema_city_entity.dart';
import 'package:fish_redux/fish_redux.dart';

enum MovieCityAction { ResetData, Refresh, ChangeTag, SelectCity }

class MovieCityActionCreator {
  static Action onRefresh(p) {
    return Action(MovieCityAction.Refresh, payload: p);
  }

  static Action onResetData(CinemaCityData data) {
    return Action(MovieCityAction.ResetData, payload: data);
  }

  static Action onChangeTag(String data) {
    return Action(MovieCityAction.ChangeTag, payload: data);
  }

  static Action onSelectCity(int id, String name) {
    return Action(MovieCityAction.SelectCity, payload: {
      'id': id,
      'name': name,
    });
  }
}
