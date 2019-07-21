import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IntegralCommodityDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<IntegralCommodityDetailState>>{
//      IntegralCommodityDetailAction.action: _onAction,
    },
  );
}

IntegralCommodityDetailState _onAction(
    IntegralCommodityDetailState state, Action action) {
  final IntegralCommodityDetailState newState = state.clone();
  return newState;
}
