import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<StoreState> buildEffect() {
  return combineEffects(<Object, Effect<StoreState>>{
    StoreAction.action: _onAction,
  });
}

void _onAction(Action action, Context<StoreState> ctx) {
}
