import 'package:fish_redux/fish_redux.dart';

enum UserDetailsEditAction { AmendText }

class UserDetailsEditActionCreator {
  static Action onAmendText(String type) {
    return Action(UserDetailsEditAction.AmendText, payload: type);
  }
}
