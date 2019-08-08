import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<DynamicDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<DynamicDetailsState>>{
    DynamicDetailsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DynamicDetailsState> ctx) {
}
