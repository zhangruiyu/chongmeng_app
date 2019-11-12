import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MovieOrderPreAction { action }

class MovieOrderPreActionCreator {
  static Action onAction() {
    return const Action(MovieOrderPreAction.action);
  }
}
