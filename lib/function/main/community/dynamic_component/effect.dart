import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<DynamicItemState> buildEffect() {
  return combineEffects(<Object, Effect<DynamicItemState>>{
    DynamicItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DynamicItemState> ctx) {
}
