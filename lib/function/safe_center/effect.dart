import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SafeCenterState> buildEffect() {
  return combineEffects(<Object, Effect<SafeCenterState>>{
    SafeCenterAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SafeCenterState> ctx) {
}
