import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class IntegralElemeItemState implements Cloneable<IntegralElemeItemState> {
  var index;
  IntegralCommodityDataElemo itemData;

  IntegralElemeItemState({this.index, this.itemData});

  @override
  IntegralElemeItemState clone() {
    return IntegralElemeItemState()
      ..index = index
      ..itemData = itemData;
  }
}

IntegralElemeItemState initState(Map<String, dynamic> args) {
  return IntegralElemeItemState();
}
