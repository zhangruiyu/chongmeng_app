import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ShippingAddressAction { action, SkipAddAddress }

class ShippingAddressActionCreator {
  static Action onAction() {
    return const Action(ShippingAddressAction.action);
  }

  static Action onSkipAddAddress() {
    return const Action(ShippingAddressAction.SkipAddAddress);
  }
}
