import 'package:fish_redux/fish_redux.dart';

enum DynamicDetailsAction { SetPic, SelectPic, Commit, Refresh, ResetData }

class DynamicDetailsActionCreator {
  static Action onSetPic(data) {
    return Action(DynamicDetailsAction.SetPic, payload: data);
  }

  static Action onSelectPic() {
    return const Action(DynamicDetailsAction.SelectPic);
  }

  static Action onCommit() {
    return const Action(DynamicDetailsAction.Commit);
  }

  static Action onRefresh(Map<String, dynamic> map) {
    return Action(DynamicDetailsAction.Refresh, payload: map);
  }

  static Action onResetData(data) {
    return Action(DynamicDetailsAction.ResetData, payload: data);
  }
}
