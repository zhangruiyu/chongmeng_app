import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AliItemProductState> buildReducer() {
  return asReducer(
    <Object, Reducer<AliItemProductState>>{
      AliItemProductAction.action: _onAction,
    },
  );
}

AliItemProductState _onAction(AliItemProductState state, Action action) {
  final AliItemProductState newState = state.clone();
  return newState;
}
