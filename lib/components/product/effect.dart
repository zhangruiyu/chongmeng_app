import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AliItemProductState> buildEffect() {
  return combineEffects(<Object, Effect<AliItemProductState>>{
    AliItemProductAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AliItemProductState> ctx) {
}
