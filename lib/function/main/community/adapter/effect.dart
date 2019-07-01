import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CommunityItemState> buildEffect() {
  return combineEffects(<Object, Effect<CommunityItemState>>{
    CommunityItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CommunityItemState> ctx) {
}
