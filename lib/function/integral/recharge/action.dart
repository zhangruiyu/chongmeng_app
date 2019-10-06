import 'package:fish_redux/fish_redux.dart';

enum RechargeAction { Pay, ChangeSelectPosition }

class RechargeActionCreator {
  static Action onPay() {
    return const Action(RechargeAction.Pay);
  }

  static Action onChangeSelectPosition(int index) {
    return Action(RechargeAction.ChangeSelectPosition, payload: index);
  }
}
