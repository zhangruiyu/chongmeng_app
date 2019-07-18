import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<DynamicListState> buildEffect() {
  return combineEffects(<Object, Effect<DynamicListState>>{
    DynamicListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DynamicListState> ctx) {
}
