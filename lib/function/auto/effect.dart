import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/global_store/action.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/network/outermost_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:umengshare/umengshare.dart';
import 'action.dart';
import 'model/login_entity.dart';
import 'state.dart';

Effect<AutoState> buildEffect() {
  return combineEffects(<Object, Effect<AutoState>>{
    AutoAction.SendAutoCode: _onSendAutoCode,
    AutoAction.Login: _onLogin,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<AutoState> ctx) {
  var textChangeListener = () {
    ctx.dispatch(AutoActionCreator.onCheckOK(
        ctx.state.telTextEditingController.text.length == 11 &&
            ctx.state.autoCodeTextEditingController.text.length == 6));
  };

  ctx.state.telTextEditingController.addListener(textChangeListener);
  ctx.state.autoCodeTextEditingController.addListener(textChangeListener);
}

Future _onSendAutoCode(Action action, Context<AutoState> ctx) async {
  var result = await RequestClient.request<OutermostEntity>(
      ctx.context, HttpConstants.SendCode,
      queryParameters: {'tel': ctx.state.telTextEditingController.text});
  if (result != null) {
    action.payload['completer']();
  }
}

Future _onLogin(Action action, Context<AutoState> ctx) async {
  if (action.payload == "qq") {
    await UMengShare.login(UMPlatform.QQ);
  } else if (action.payload == "wechat") {
    //微信需要开发者资质认证
    var result = await UMengShare.login(UMPlatform.Wechat);
    println("result $result");
  }

  var result = await RequestClient.request<LoginEntity>(
      ctx.context, HttpConstants.LoginAndRegister,
      queryParameters: {
        'tel': ctx.state.telTextEditingController.text,
        'type': 'tel',
        'autoCode': ctx.state.autoCodeTextEditingController.text
      });
  if (result != null) {
    GlobalStore.store.dispatch(GlobalActionCreator.onUpdateLocalUser(result.data));
    Navigator.pop(ctx.context);
  }
}
