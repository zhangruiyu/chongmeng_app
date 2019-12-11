import 'package:fish_redux/fish_redux.dart';

enum MovieAction {
  ResetData,
  Refresh,
  SkipMovieDetailsPage,
  Share,
  SelectCity,
  SetDistrictText
}

class MovieActionCreator {
  static Action onRefresh(p) {
    return Action(MovieAction.Refresh, payload: p);
  }

  static Action onResetData(p) {
    return Action(MovieAction.ResetData, payload: p);
  }

  static Action onSkipMovieDetailsPage(p) {
    return Action(MovieAction.SkipMovieDetailsPage, payload: p);
  }

  static Action onShare() {
    return Action(MovieAction.Share);
  }

  static Action onSelectCity() {
    return Action(MovieAction.SelectCity);
  }

  static Action onSetDistrictText(t) {
    return Action(MovieAction.SetDistrictText, payload: t);
  }
}
