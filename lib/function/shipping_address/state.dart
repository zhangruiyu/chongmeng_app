import 'package:fish_redux/fish_redux.dart';

class ShippingAddressState implements Cloneable<ShippingAddressState> {

  @override
  ShippingAddressState clone() {
    return ShippingAddressState();
  }
}

ShippingAddressState initState(Map<String, dynamic> args) {
  return ShippingAddressState();
}
