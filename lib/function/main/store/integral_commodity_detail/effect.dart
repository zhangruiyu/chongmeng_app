import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<IntegralCommodityDetailState> buildEffect() {
  return combineEffects(<Object, Effect<IntegralCommodityDetailState>>{
    IntegralCommodityDetailAction.action: _onAction,
  });
}

void _onAction(Action action, Context<IntegralCommodityDetailState> ctx) {
}
