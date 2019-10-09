import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RechargeState> buildReducer() {
  return asReducer(
    <Object, Reducer<RechargeState>>{
      RechargeAction.ChangeSelectPosition: _onChangeSelectPosition,
      RechargeAction.ReSetData: _onReSetData,
    },
  );
}

RechargeState _onChangeSelectPosition(RechargeState state, Action action) {
  final RechargeState newState = state.clone()
    ..selectItemPosition = action.payload;
  return newState;
}

RechargeState _onReSetData(RechargeState state, Action action) {
  final RechargeState newState = state.clone()..data = action.payload;
  return newState;
}
