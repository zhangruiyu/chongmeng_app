import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyOrderState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyOrderState>>{
      MyOrderAction.action: _onAction,
    },
  );
}

MyOrderState _onAction(MyOrderState state, Action action) {
  final MyOrderState newState = state.clone();
  return newState;
}
