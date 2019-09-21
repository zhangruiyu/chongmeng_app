import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
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
    UserDetailsAction.RefreshDynamic: _onRefreshDynamic,
    UserDetailsAction.LoadMoreDynamic: _onLoadMoreDynamic,
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
  });
}

void _initState(Action action, Context<UserDetailsState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as UserDetailsPageState;
  ctx.state
    ..tabController = new TabController(
        vsync: tickerProvider,
        length: ctx.state.pageData.length,
        initialIndex: 0);
  ctx.dispatch(UserDetailsActionCreator.onRefresh(null));
}

Future _onRefresh(Action action, Context<UserDetailsState> ctx) async {
  var result = await RequestClient.request<UserDetailsEntity>(
      ctx.context, HttpConstants.UserProfile);
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    ctx.dispatch(UserDetailsActionCreator.onSetUserData(result.data.data));
  }
}

Future _onRefreshDynamic(Action action, Context<UserDetailsState> ctx) async {
  var result = await RequestClient.request<DynamicListEntity>(
    ctx.context,
    HttpConstants.DynamicList,
    queryParameters: {
      'filtrateType': action.payload['filtrateType'] + "," + "UserIdType",
      "pageSize": 8,
      "pageIndex": 0,
      'user_id': UserHelper.getOnlineUser().userId
    },
  );
  action.payload['completer']();
  if (result.hasSuccess) {
    ctx.dispatch(UserDetailsActionCreator.onResetPageData({
      'data': result.data.data,
      'filtrateType': action.payload['filtrateType'],
      'pageIndex': 1,
    }));
  }
}

Future _onLoadMoreDynamic(Action action, Context<UserDetailsState> ctx) async {
  var filtrateType = action.payload['filtrateType'];
  var itemPageData = ctx.state.pageData[filtrateType];
  var result = await RequestClient.request<DynamicListEntity>(
    ctx.context,
    HttpConstants.DynamicList,
    queryParameters: {
      'filtrateType': action.payload['filtrateType'] + "," + "UserIdType",
      "pageSize": 8,
      "pageIndex": itemPageData.pageIndex,
      'user_id': UserHelper.getOnlineUser().userId
    },
  );
  action.payload['completer']();

  if (result.hasSuccess) {
    ctx.dispatch(UserDetailsActionCreator.onAddPageListData({
      'data': result.data.data,
      'filtrateType': action.payload['filtrateType'],
      'pageIndex': (itemPageData.pageIndex + 1)
    }));
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
