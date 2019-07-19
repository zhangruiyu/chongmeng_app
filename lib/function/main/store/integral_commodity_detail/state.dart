import 'package:fish_redux/fish_redux.dart';

class IntegralCommodityDetailState implements Cloneable<IntegralCommodityDetailState> {

  @override
  IntegralCommodityDetailState clone() {
    return IntegralCommodityDetailState();
  }
}

IntegralCommodityDetailState initState(Map<String, dynamic> args) {
  return IntegralCommodityDetailState();
}
