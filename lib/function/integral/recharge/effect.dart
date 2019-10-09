import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:fluwx/fluwx.dart';
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'model/wx_pay_entity.dart';
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
  fluwx.responseFromPayment.listen((WeChatPaymentResponse response) {
    //支付成功
    if (response.errCode == 0) {
      //轮训请求
    } else {
      showToast(response.errStr);
    }
    println("response:::: ${response.errCode}");
  });
}

Future _onPay(Action action, Context<RechargeState> ctx) async {
  var result = await RequestClient.request<WxPayEntity>(
      ctx.context, HttpConstants.PayPre,
      queryParameters: {'price': '0.1'});
  if (result.hasSuccess) {
    var data = result.data.data;
    //安装微信
    if (await fluwx.isWeChatInstalled()) {
      fluwx.pay(
        appId: data.appid,
        partnerId: data.partnerid,
        prepayId: data.prepayid,
        packageValue: data.package,
        nonceStr: data.noncestr,
        timeStamp: data.timestamp,
        sign: data.sign,
//          signType: '选填',
//          extData: '选填'
      );
    }
  }
}
