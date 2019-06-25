import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ReviewIVState> buildEffect() {
  return combineEffects(<Object, Effect<ReviewIVState>>{
    ReviewIVAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ReviewIVState> ctx) {
}
