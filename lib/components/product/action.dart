import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AliItemProductAction { action }

class AliItemProductActionCreator {
  static Action onAction() {
    return const Action(AliItemProductAction.action);
  }
}
