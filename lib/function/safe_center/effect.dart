import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SafeCenterState> buildEffect() {
  return combineEffects(<Object, Effect<SafeCenterState>>{
    SafeCenterAction.QQBindBackend: _onQQBindBackend,
    SafeCenterAction.WXBindBackend: _onWXBindBackend,
  });
}

void _onQQBindBackend(Action action, Context<SafeCenterState> ctx) {
  ctx.dispatch(SafeCenterActionCreator.onQQBind(action.payload));
}

void _onWXBindBackend(Action action, Context<SafeCenterState> ctx) {
  ctx.dispatch(SafeCenterActionCreator.onWXBind(action.payload));
}
