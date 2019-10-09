import 'package:fish_redux/fish_redux.dart';

import 'model/recharge_commodity_entity.dart';

class RechargeState implements Cloneable<RechargeState> {
  List<RechargeCommodityData> data;
  int selectItemPosition;

  @override
  RechargeState clone() {
    return RechargeState()
      ..data = data
      ..selectItemPosition = selectItemPosition;
  }
}

RechargeState initState(Map<String, dynamic> args) {
  return RechargeState()..selectItemPosition = 0;
}
