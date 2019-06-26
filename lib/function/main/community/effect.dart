import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CommunityState> buildEffect() {
  return combineEffects(<Object, Effect<CommunityState>>{
    CommunityAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CommunityState> ctx) {
}
