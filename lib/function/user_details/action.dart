import 'package:fish_redux/fish_redux.dart';

enum UserDetailsAction { action }

class UserDetailsActionCreator {
  static Action onAction() {
    return const Action(UserDetailsAction.action);
  }
}
