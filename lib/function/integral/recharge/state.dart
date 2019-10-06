import 'package:fish_redux/fish_redux.dart';

class RechargeState implements Cloneable<RechargeState> {
  List<RechargeList> rechargeList;
  int selectItemPosition;

  @override
  RechargeState clone() {
    return RechargeState()
      ..rechargeList = rechargeList
      ..selectItemPosition = selectItemPosition;
  }
}

RechargeState initState(Map<String, dynamic> args) {
  return RechargeState()
    ..rechargeList = [
      RechargeList(100, 0, 1),
      RechargeList(1000, 50, 10),
      RechargeList(2000, 120, 20),
      RechargeList(5000, 300, 50),
      RechargeList(10000, 700, 100),
    ]
    ..selectItemPosition = 1;
}

class RechargeList {
  //充值获取的积分
  int primary;

  //赠送的积分
  int give;

  //花费金额
  int money;

  RechargeList(this.primary, this.give, this.money);
}
