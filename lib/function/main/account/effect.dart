import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AccountState> buildEffect() {
  return combineEffects(<Object, Effect<AccountState>>{
    Lifecycle.initState: _initState,
    AccountAction.Refresh: _onRefresh,
  });
}

void _onRefresh(Action action, Context<AccountState> ctx) {
  if (UserHelper.isLogin()) {
    RequestClient.request(ctx.context, HttpConstants.AccountIndex);
  }
}

void _initState(Action action, Context<AccountState> ctx) {
  _onRefresh(action, ctx);
}
