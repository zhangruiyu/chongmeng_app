import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SignInResultDialogAction { action }

class SignInResultDialogActionCreator {
  static Action onAction() {
    return const Action(SignInResultDialogAction.action);
  }
}
