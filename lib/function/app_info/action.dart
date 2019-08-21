import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AppInfoAction { action }

class AppInfoActionCreator {
  static Action onAction() {
    return const Action(AppInfoAction.action);
  }
}
