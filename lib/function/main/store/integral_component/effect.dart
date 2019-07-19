import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<IntegralItemState> buildEffect() {
  return combineEffects(<Object, Effect<IntegralItemState>>{
    IntegralItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<IntegralItemState> ctx) {
}
