import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommunityUserHeadAction { action }

class CommunityUserHeadActionCreator {
  static Action onAction() {
    return const Action(CommunityUserHeadAction.action);
  }
}
