import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UserDetailsAction { action }

class UserDetailsActionCreator {
  static Action onAction() {
    return const Action(UserDetailsAction.action);
  }
}
