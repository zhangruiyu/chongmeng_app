import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/share/state.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'model/invite_entity.dart';
import 'state.dart';

Effect<InviteState> buildEffect() {
  return combineEffects(<Object, Effect<InviteState>>{
    InviteAction.Refresh: _onRefresh,
    InviteAction.Share: _onShare,
  });
}

Future _onRefresh(Action action, Context<InviteState> ctx) async {
  (await RequestClient.request<InviteEntity>(
          ctx.context, HttpConstants.inviteRecord))
      .yes((value) {
    ctx.dispatch(InviteActionCreator.onReSetData(value.data));
  });
  CompleterUtils.complete(action);
}

Future _onShare(Action action, Context<InviteState> ctx) async {
  showModalBottomSheet(
      context: ctx.context,
      builder: (BuildContext context) {
        return routes.buildPage(PageConstants.SharePage, {
          "type": ShareState.text,
          "content": ""
//          """${ctx.state.itemData.title}\n【在售价】${ctx.state.itemData.zkFinalPriceWap}元\n【券后价】${ctx.state.itemData.couponValue}元\n【下单链接】${result.data.data.clickUrl} \n----------------- \n复制这条信息，${result.data.data.tpwd}，到【手机淘宝】即可查看"""
        });
      });
}
