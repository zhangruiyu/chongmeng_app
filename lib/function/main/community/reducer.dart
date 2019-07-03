import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommunityState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommunityState>>{
      CommunityAction.AddPageListData: _onAddPageListData,
    },
  );
}

CommunityState _onAddPageListData(CommunityState state, Action action) {
  final CommunityState newState = state.clone();
  int filtrateType = action.payload['filtrateType'];
  newState.pageData[filtrateType].data = action.payload['data'];
  return newState;
}
