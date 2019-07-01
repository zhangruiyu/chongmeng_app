import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommunityItemAction { action }

class CommunityItemActionCreator {
  static Action onAction() {
    return const Action(CommunityItemAction.action);
  }
}
