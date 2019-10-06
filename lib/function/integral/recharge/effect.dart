import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

Effect<RechargeState> buildEffect() {
  return combineEffects(<Object, Effect<RechargeState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    RechargeAction.Pay: _onPay,
  });
}

void _dispose(Action action, Context<RechargeState> ctx) {}

void _initState(Action action, Context<RechargeState> ctx) {
  fluwx.responseFromPayment.listen((response) {});
}

Future _onPay(Action action, Context<RechargeState> ctx) async {
  //安装微信
  if (await fluwx.isWeChatInstalled()) {
    fluwx.pay(
        appId: 'wxd930ea5d5a258f4f',
        partnerId: '1900000109',
        prepayId: '1101000000140415649af9fc314aa427',
        packageValue: 'Sign=WXPay',
        nonceStr: '1101000000140429eb40476f8896f4c9',
        timeStamp: 1398746574,
        sign: '7FFECB600D7157C5AA49810D2D8F28BC2811827B',
        signType: '选填',
        extData: '选填');
  }
}
