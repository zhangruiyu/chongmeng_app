import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:fish_redux/fish_redux.dart';

import 'adapter/state.dart';
import 'model/integral_commodity_entity.dart';

class StoreState implements Cloneable<StoreState> {
  HomeData storeData;

  List<IntegralCommodityData> integralCommodityData;

  @override
  StoreState clone() {
    return StoreState()..integralCommodityData = integralCommodityData;
  }

  static StoreState initState(Map<String, dynamic> args) {
    return StoreState();
  }
}

class IntegralStoreConnector extends ConnOp<StoreState, IntegralStoreState> {
  @override
  void set(StoreState state, IntegralStoreState subState) {
    super.set(state, subState);
  }

  @override
  IntegralStoreState get(StoreState state) {
    return IntegralStoreState()
      ..integralCommodityData = state.integralCommodityData;
  }
}
