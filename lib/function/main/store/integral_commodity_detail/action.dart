import 'package:fish_redux/fish_redux.dart';

enum IntegralCommodityDetailAction { Buy }

class IntegralCommodityDetailActionCreator {
  static Action onBuy() {
    return const Action(IntegralCommodityDetailAction.Buy);
  }
}
