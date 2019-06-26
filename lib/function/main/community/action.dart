import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommunityAction { action }

class CommunityActionCreator {
  static Action onAction() {
    return const Action(CommunityAction.action);
  }
}
