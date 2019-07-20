import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ShippingAddressState> buildReducer() {
  return asReducer(
    <Object, Reducer<ShippingAddressState>>{
      ShippingAddressAction.action: _onAction,
    },
  );
}

ShippingAddressState _onAction(ShippingAddressState state, Action action) {
  final ShippingAddressState newState = state.clone();
  return newState;
}
