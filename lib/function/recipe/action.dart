import 'package:fish_redux/fish_redux.dart';

enum RecipeAction { ResetData, Refresh }

class RecipeActionCreator {
  static Action onAction(data) {
    return Action(RecipeAction.ResetData, payload: data);
  }

  static Action onRefresh(data) {
    return Action(RecipeAction.Refresh, payload: data);
  }
}
