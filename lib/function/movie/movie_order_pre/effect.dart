import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'state.dart';

Effect<MovieOrderPreState> buildEffect() {
  return combineEffects(<Object, Effect<MovieOrderPreState>>{
    Lifecycle.initState: _initState,
    MovieOrderPreAction.Commit: _onCommit,
  });
}

void _initState(Action action, Context<MovieOrderPreState> ctx) {}

void _onCommit(Action action, Context<MovieOrderPreState> ctx) {
  var state = ctx.state;
  if (state.order.totalUserIntegral < state.order.totalPay) {
    showToast("积分不足");
  } else {}
}
