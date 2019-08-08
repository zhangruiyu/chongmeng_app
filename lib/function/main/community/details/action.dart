import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DynamicDetailsAction { action }

class DynamicDetailsActionCreator {
  static Action onAction() {
    return const Action(DynamicDetailsAction.action);
  }
}
