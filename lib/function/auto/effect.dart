import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/my_pet/selecttype/model/pet_type_entity.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/global_store/action.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
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
      queryParameters: {'tel': ctx.state.telTextEditingController.text},
      showLoadingIndicator: true);
  if (result.hasSuccess) {
    action.payload['completer']();
  }
}

Future _onLogin(Action action, Context<AutoState> ctx) async {
  Result<LoginEntity> result;
  //第三方登录的参数
  Map<String, dynamic> queryParameters;
  if (action.payload == "qq") {
//{msg: , ret: 0, unionid: , gender: 男, is_yellow_vip: 0, city: 朝阳, level: 0, openid: 050DE67E9DF84FDA37DCF08F94D6FF2F, profile_image_url: http://thirdqq.qlogo.cn/g?b=oidb&k=3OPDOC5fkyMSpudJ2Hvdmw&s=100, accessToken: D9F5599646F6B19E59FA13D022433405, access_token: D9F5599646F6B19E59FA13D022433405, uid: 050DE67E9DF84FDA37DCF08F94D6FF2F, is_yellow_year_vip: 0, province: 北京, screen_name: 牛顿, name: 牛顿, iconurl: http://thirdqq.qlogo.cn/g?b=oidb&k=3OPDOC5fkyMSpudJ2Hvdmw&s=100, yellow_vip_level: 0, expiration: 1568907416357, vip: 0, expires_in: 1568907416357, um_status: SUCCESS}
    var qqResult = await UMengShare.login(UMPlatform.QQ);
    if (qqResult['um_status'] != "SUCCESS") {
      return;
    }
    //后台处理结果
    queryParameters = ((await UMengShare.login(UMPlatform.QQ))
            as Map<dynamic, dynamic>)
        .map((key, value) {
      return MapEntry(key.toString(), value);
    })
          ..['type'] = action.payload;
    result = await RequestClient.request<LoginEntity>(
        ctx.context, HttpConstants.LoginAndRegister,
        queryParameters: queryParameters);
  } else if (action.payload == "wechat") {
    //微信需要开发者资质认证
    var result = await UMengShare.login(UMPlatform.Wechat);
    println("result $result");
  } else {
    result = await RequestClient.request<LoginEntity>(
        ctx.context, HttpConstants.LoginAndRegister,
        queryParameters: {
          'tel': ctx.state.telTextEditingController.text,
          'type': 'tel',
          'autoCode': ctx.state.autoCodeTextEditingController.text,
        },
        showLoadingIndicator: true);
  }

  if (result.hasSuccess) {
    GlobalStore.store
        .dispatch(GlobalActionCreator.onUpdateLocalUser(result.data.data));
    if (result.data.data.hasPet) {
      Navigator.pop(ctx.context);
    } else {
      var petTypeEntity = await RequestClient.request<PetTypeEntity>(
          ctx.context, HttpConstants.PetType);
      if (petTypeEntity.hasSuccess) {
        Navigator.popAndPushNamed(ctx.context, PageConstants.SelectTypePage,
            arguments: {'petTypeEntity': petTypeEntity.data.data});
      } else {
        Navigator.pop(ctx.context);
      }
    }
  } else if (result.code == ErrorCode.BIND_TEL_ERROR_CODE) {
    //跳转到验证手机号,然后绑定手机号
    Navigator.pushNamed(ctx.context, PageConstants.BindTelPage, arguments: {
      'queryParameters': queryParameters,
    });
  }
}
