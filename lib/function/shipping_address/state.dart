import 'package:fish_redux/fish_redux.dart';

import 'model/shipping_address_entity.dart';

class ShippingAddressState implements Cloneable<ShippingAddressState> {
  List<ShippingAddressData> data;

  @override
  ShippingAddressState clone() {
    return ShippingAddressState()..data = data;
  }
}

ShippingAddressState initState(Map<String, dynamic> args) {
  return ShippingAddressState()..data = [];
}
