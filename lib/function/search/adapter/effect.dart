import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchListState> buildEffect() {
  return combineEffects(<Object, Effect<SearchListState>>{
    SearchListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SearchListState> ctx) {
}
