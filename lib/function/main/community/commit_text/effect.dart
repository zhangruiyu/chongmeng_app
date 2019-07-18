import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CommitTextState> buildEffect() {
  return combineEffects(<Object, Effect<CommitTextState>>{
    CommitTextAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CommitTextState> ctx) {
}
