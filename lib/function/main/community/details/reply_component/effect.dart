import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ReplyState> buildEffect() {
  return combineEffects(<Object, Effect<ReplyState>>{
    ReplyAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ReplyState> ctx) {
}
