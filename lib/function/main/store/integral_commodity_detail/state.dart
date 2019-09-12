import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class IntegralCommodityDetailState
    implements Cloneable<IntegralCommodityDetailState> {
  int index;
  IntegralCommodityDataIntegralcommodity itemData;

  int totalIntegral;

  @override
  IntegralCommodityDetailState clone() {
    return IntegralCommodityDetailState()
      ..totalIntegral = totalIntegral
      ..index = index
      ..itemData = itemData;
  }
}

IntegralCommodityDetailState initState(Map<String, dynamic> args) {
  return IntegralCommodityDetailState()
    ..itemData = args['itemData']
    ..index = args['index'];
}
