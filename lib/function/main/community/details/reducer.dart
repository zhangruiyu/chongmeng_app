import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DynamicDetailsState> buildReducer() {
  return asReducer(
    <Object, Reducer<DynamicDetailsState>>{
      DynamicDetailsAction.action: _onAction,
    },
  );
}

DynamicDetailsState _onAction(DynamicDetailsState state, Action action) {
  final DynamicDetailsState newState = state.clone();
  return newState;
}
