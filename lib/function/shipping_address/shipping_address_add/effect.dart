import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:overlay_support/overlay_support.dart';
import 'action.dart';
import 'state.dart';

Effect<ShippingAddressAddState> buildEffect() {
  return combineEffects(<Object, Effect<ShippingAddressAddState>>{
    ShippingAddressAddAction.SelectCity: _onSelectCity,
    ShippingAddressAddAction.CommitAddress: _onCommitAddress,
  });
}

void _onCommitAddress(Action action, Context<ShippingAddressAddState> ctx) {
  if (ctx.state.consigneeTextEditingController.text.length < 1 ||
      ctx.state.consigneeTextEditingController.text.length > 15) {
    toast(ctx.context, "收件人名称不能小于1位或者大于15位");
    return;
  }
  if (ctx.state.telTextEditingController.text.length != 11) {
    toast(ctx.context, "手机号应为11位");
    return;
  }

  if (ctx.state.addressTextEditingController.text.length > 50) {
    toast(ctx.context, "收件地址不能大于50位");
    return;
  }
  if (ctx.state.result == null) {
    ctx.dispatch(ShippingAddressAddActionCreator.onSelectCity());
    return;
  }
  RequestClient.request(ctx.context, HttpConstants.AddAddress);
}

//选择城市
Future _onSelectCity(
    Action action, Context<ShippingAddressAddState> ctx) async {
  ctx.dispatch(ShippingAddressAddActionCreator.onSetCity(
      await CityPickers.showCityPicker(
    context: ctx.context,
  )));
}
