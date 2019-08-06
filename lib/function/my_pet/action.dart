import 'package:fish_redux/fish_redux.dart';

enum MyPetAction { ResetData, Refresh, SkipAddPetPage }

class MyPetActionCreator {
  static Action onResetData() {
    return const Action(MyPetAction.ResetData);
  }

  static Action onRefresh(Map<String, dynamic> map) {
    return Action(MyPetAction.Refresh, payload: map);
  }

  static Action onSkipAddPetPage() {
    return Action(MyPetAction.SkipAddPetPage);
  }
}
