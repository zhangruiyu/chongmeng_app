import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SignInAction { action }

class SignInActionCreator {
  static Action onAction() {
    return const Action(SignInAction.action);
  }
}
