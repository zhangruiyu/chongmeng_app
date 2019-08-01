import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AdoptionAddState> buildReducer() {
  return asReducer(
    <Object, Reducer<AdoptionAddState>>{
      AdoptionAddAction.ChangeSelectPic: _onChangeSelectPic,
    },
  );
}

AdoptionAddState _onChangeSelectPic(AdoptionAddState state, Action action) {
  final AdoptionAddState newState = state.clone()
    ..selectPicList = action.payload;
  return newState;
}
