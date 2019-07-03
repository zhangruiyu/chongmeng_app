import 'package:chongmeng/function/auto/model/login_entity.dart';
import 'package:fish_redux/fish_redux.dart';

enum GlobalAction { ChangeLanguage, UpdateLocalUser, LoginOut }

class GlobalActionCreator {
  static Action onChangeLanguage() {
    return const Action(GlobalAction.ChangeLanguage);
  }

  static Action onUpdateLocalUser(LoginData user) {
    return Action(GlobalAction.UpdateLocalUser, payload: user);
  }

  static Action onLoginOut() {
    return Action(
      GlobalAction.LoginOut,
    );
  }
}
