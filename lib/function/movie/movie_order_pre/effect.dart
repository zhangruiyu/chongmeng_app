import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MovieOrderPreState> buildEffect() {
  return combineEffects(<Object, Effect<MovieOrderPreState>>{
    MovieOrderPreAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MovieOrderPreState> ctx) {
}
