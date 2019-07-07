import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<TallyState> buildEffect() {
  return combineEffects(<Object, Effect<TallyState>>{
    TallyAction.action: _onAction,
  });
}

void _onAction(Action action, Context<TallyState> ctx) {
}
