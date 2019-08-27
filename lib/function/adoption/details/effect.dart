import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

import 'action.dart';
import 'state.dart';

Effect<AdoptionDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<AdoptionDetailsState>>{
    AdoptionDetailsAction.ShowAdoptionDialog: _onShowAdoptionDialog,
  });
}

Future _onShowAdoptionDialog(
    Action action, Context<AdoptionDetailsState> ctx) async {
  JMConversationInfo conversation = await jmessage.createConversation(
      target: JMSingle.fromJson({
    'username':
        JiguangUtils.imUserNamePrefix + ctx.state.data.userId.toString(),
    "appKey": JiguangUtils.JpushKey
  }));
  NavigatorHelper.skipConversationItemPage(ctx.context, conversation);
}
