import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ItemBodyState> buildEffect() {
  return combineEffects(<Object, Effect<ItemBodyState>>{
    ItemBodyAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ItemBodyState> ctx) {
}
