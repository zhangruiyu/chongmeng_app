import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PetAddState> buildReducer() {
  return asReducer(
    <Object, Reducer<PetAddState>>{
      PetAddAction.SetAvatarPath: _onSetAvatarPath,
    },
  );
}

PetAddState _onSetAvatarPath(PetAddState state, Action action) {
  final PetAddState newState = state.clone()..petAvatar = action.payload;
  return newState;
}
