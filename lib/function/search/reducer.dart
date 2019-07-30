import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchState>>{
      SearchAction.ResetData: _onResetData,
      SearchAction.AddData: _onAddData,
    },
  );
}

SearchState _onResetData(SearchState state, Action action) {
  final SearchState newState = state.clone()
    ..data = action.payload
    ..index = 1;
  if ((action.payload as List<AliProductItem>)?.isNotEmpty == true) {
    newState.pageState = SearchState.HASDATA;
  }
  return newState;
}

SearchState _onAddData(SearchState state, Action action) {
  final SearchState newState = state.clone()
    ..data.addAll(action.payload['data'])
    ..index = action.payload['index'];
  return newState;
}
