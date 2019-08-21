import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<UserDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<UserDetailsState>>{
    UserDetailsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<UserDetailsState> ctx) {
}
