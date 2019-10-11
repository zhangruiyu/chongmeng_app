import 'package:fish_redux/fish_redux.dart';

import 'model/recharge_commodity_entity.dart';
import 'model/wx_pay_entity.dart';

class RechargeState implements Cloneable<RechargeState> {
  List<RechargeCommodityData> data;
  int selectItemPosition;
  WxPayData payPre;

  @override
  RechargeState clone() {
    return RechargeState()
      ..data = data
      ..selectItemPosition = selectItemPosition
      ..payPre = payPre;
  }
}

RechargeState initState(Map<String, dynamic> args) {
  return RechargeState()..selectItemPosition = 0;
}
