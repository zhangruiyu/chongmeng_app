import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'model/safe_entity.dart';
import 'state.dart';

Effect<SafeCenterState> buildEffect() {
  return combineEffects(<Object, Effect<SafeCenterState>>{
    SafeCenterAction.QQBindBackend: _onQQBindBackend,
    SafeCenterAction.WXBindBackend: _onWXBindBackend,
    SafeCenterAction.Refresh: _onRefresh,
  });
}

Future _onRefresh(Action action, Context<SafeCenterState> ctx) async {
  var result = await RequestClient.request<SafeEntity>(
      ctx.context, HttpConstants.SafeState);
  CompleterUtils.complete(action);
  result.yes((value) {
    ctx.dispatch(SafeCenterActionCreator.onResetData(value.data));
  });
}

void _onQQBindBackend(Action action, Context<SafeCenterState> ctx) {
  if (ctx.state.data.isBindQq) {
    RequestClient.request(ctx.context, "requestUrl",
        showLoadingIndicator: true,
        queryParameters: {
          'action': "unbind",
          'type': "qq",
        });
  }
  ctx.dispatch(SafeCenterActionCreator.onQQBind(action.payload));
}

void _onWXBindBackend(Action action, Context<SafeCenterState> ctx) {
  ctx.dispatch(SafeCenterActionCreator.onWXBind(action.payload));
}
