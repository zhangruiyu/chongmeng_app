import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AdoptionDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<AdoptionDetailsState>>{
    AdoptionDetailsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AdoptionDetailsState> ctx) {
}
