import 'package:fish_redux/fish_redux.dart';

enum MovieDetailsAction { SetDetailsData, Refresh }

class MovieDetailsActionCreator {
  static Action onRefresh(p) {
    return Action(MovieDetailsAction.Refresh, payload: p);
  }

  static Action onSetDetailsData(p) {
    return Action(MovieDetailsAction.SetDetailsData, payload: p);
  }
}
