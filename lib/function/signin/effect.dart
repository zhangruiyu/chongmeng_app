import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SignInState> buildEffect() {
  return combineEffects(<Object, Effect<SignInState>>{
    SignInAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SignInState> ctx) {
}
