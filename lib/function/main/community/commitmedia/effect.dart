import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CommitMediaState> buildEffect() {
  return combineEffects(<Object, Effect<CommitMediaState>>{
    CommitMediaAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CommitMediaState> ctx) {
}
