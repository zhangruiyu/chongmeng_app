import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:fluwx/fluwx.dart';
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'model/recharge_commodity_entity.dart';
import 'model/wx_pay_entity.dart';
import 'state.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

Effect<RechargeState> buildEffect() {
  return combineEffects(<Object, Effect<RechargeState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    RechargeAction.Pay: _onPay,
    RechargeAction.Refresh: _onRefresh,
  });
}

Future _onRefresh(Action action, Context<RechargeState> ctx) async {
  var result = await RequestClient.request<RechargeCommodityEntity>(
      ctx.context, HttpConstants.MoneyAllCommodity);
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    ctx.dispatch(RechargeActionCreator.onReSetData(result.data.data));
  }
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
  var itemCommodity = ctx.state.data[ctx.state.selectItemPosition];
  var result = await RequestClient.request<WxPayEntity>(
      ctx.context, HttpConstants.PayPre,
      queryParameters: {'commodityId': itemCommodity.id});
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
