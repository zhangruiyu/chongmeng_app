import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UploadImageState> buildReducer() {
  return asReducer(
    <Object, Reducer<UploadImageState>>{
      UploadImageAction.action: _onAction,
    },
  );
}

UploadImageState _onAction(UploadImageState state, Action action) {
  final UploadImageState newState = state.clone();
  return newState;
}
