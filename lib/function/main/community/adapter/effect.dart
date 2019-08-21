import 'package:chongmeng/function/main/community/item_body/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';

Effect<ItemBodyState> buildEffect() {
  return combineEffects(<Object, Effect<ItemBodyState>>{
    DynamicListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ItemBodyState> ctx) {}
