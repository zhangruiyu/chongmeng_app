import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'home/model/home_entity.dart';
import 'state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    Lifecycle.initState: _initState
//    MainAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MainState> ctx) {}

Future _initState(Action action, Context<MainState> ctx) async {}
