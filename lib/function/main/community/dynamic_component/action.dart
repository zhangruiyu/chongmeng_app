import 'package:fish_redux/fish_redux.dart';

enum DynamicItemAction { RequestSetLiked, ResetLiked }

class DynamicItemActionCreator {
  static Action onRequestSetLiked(Map<String, dynamic> paramsMap) {
    return Action(DynamicItemAction.RequestSetLiked, payload: paramsMap);
  }

  static Action onResetLiked(paramsMap) {
    return Action(DynamicItemAction.ResetLiked, payload: paramsMap);
  }
}
