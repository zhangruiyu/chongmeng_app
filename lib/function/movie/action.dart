import 'package:fish_redux/fish_redux.dart';

enum MovieAction { ResetData, Refresh, SkipMovieDetailsPage }

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
}
