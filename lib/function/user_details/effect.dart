import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import '../../routes.dart';
import 'action.dart';
import 'model/user_details_entity.dart';
import 'state.dart';

Effect<UserDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<UserDetailsState>>{
    UserDetailsAction.Refresh: _onRefresh,
    UserDetailsAction.SkipEditUserPage: _onSkipEditUserPage,
    Lifecycle.dispose: _dispose,
  });
}

Future _onRefresh(Action action, Context<UserDetailsState> ctx) async {
  var result = await RequestClient.request<UserDetailsEntity>(
      ctx.context, HttpConstants.UserProfile);
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    ctx.dispatch(UserDetailsActionCreator.onSetUserData(result.data.data));
  }
}

Future _onSkipEditUserPage(Action action, Context<UserDetailsState> ctx) async {
  var data = await Navigator.pushNamed(
      ctx.context, PageConstants.UserDetailsEditPage,
      arguments: {'userData': ctx.state.data});
  if (data != null) ctx.dispatch(UserDetailsActionCreator.onSetUserData(data));
}

void _dispose(Action action, Context<UserDetailsState> ctx) {
  if (ctx.state.data != null) UserHelper.updateUserInfo(ctx.state.data);
}
