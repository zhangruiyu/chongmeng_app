import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SelectPetAvatarState> buildReducer() {
  return asReducer(
    <Object, Reducer<SelectPetAvatarState>>{
      SelectPetAvatarAction.SetAvatarPath: _onSetAvatarPath,
    },
  );
}

SelectPetAvatarState _onSetAvatarPath(
    SelectPetAvatarState state, Action action) {
  final SelectPetAvatarState newState = state.clone()
    ..petAvatar = action.payload;
  return newState;
}
