import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'action.dart';
import 'model/coupon_entity.dart';
import 'state.dart';

Effect<CouponDetailState> buildEffect() {
  return combineEffects(<Object, Effect<CouponDetailState>>{
    CouponDetailAction.GetCoupon: _onGetCoupon,
    CouponDetailAction.OpenEleme: _onOpenEleme,
  });
}

Future _onOpenEleme(Action action, Context<CouponDetailState> ctx) async {
  launch("eleme://");
}

Future _onGetCoupon(Action action, Context<CouponDetailState> ctx) async {
  if (int.tryParse(ctx.state.telEditingController.text) == null) {
    showToast('手机号格式不正确');
  } else {
    GlobalStore.store
        .getState()
        .sp
        .setString('couponTel', ctx.state.telEditingController.text);
    (await RequestClient.request<CouponEntity>(ctx.context, HttpConstants.Elema,
            queryParameters: {
              'phone': ctx.state.telEditingController.text,
              'type': ctx.state.itemData.type
            },
            showLoadingIndicator: true))
        .yes((value) {
      ctx.dispatch(CouponDetailActionCreator.onSetCoupon(value.data));
    });
  }
}