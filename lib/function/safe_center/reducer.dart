import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SafeCenterState> buildReducer() {
  return asReducer(
    <Object, Reducer<SafeCenterState>>{
      SafeCenterAction.QQBind: _onQQBind,
      SafeCenterAction.WXBind: _onWXBind,
      SafeCenterAction.ResetData: _onResetData,
    },
  );
}

SafeCenterState _onResetData(SafeCenterState state, Action action) {
  final SafeCenterState newState = state.clone()..data = action.payload;
  return newState;
}

SafeCenterState _onQQBind(SafeCenterState state, Action action) {
  final SafeCenterState newState = state.clone();
  return newState;
}

SafeCenterState _onWXBind(SafeCenterState state, Action action) {
  final SafeCenterState newState = state.clone();
  return newState;
}
