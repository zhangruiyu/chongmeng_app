import 'package:fish_redux/fish_redux.dart';

enum DynamicDetailsAction { SetPic, SelectPic, Commit }

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
}
