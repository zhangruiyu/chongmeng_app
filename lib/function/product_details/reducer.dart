import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ProductDetailsState> buildReducer() {
  return asReducer(
    <Object, Reducer<ProductDetailsState>>{
      ProductDetailsAction.action: _onAction,
    },
  );
}

ProductDetailsState _onAction(ProductDetailsState state, Action action) {
  final ProductDetailsState newState = state.clone();
  return newState;
}
