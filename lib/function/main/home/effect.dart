import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'model/home_entity.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.Refresh: _onRefresh,
    Lifecycle.initState: _initState,
  });
}

Future _onRefresh(Action action, Context<HomeState> ctx) async {
  var homeData = await RequestClient.request<HomeEntity>(
      ctx.context, HttpConstants.HomeIndex);
  action.payload['completer']();
  if (homeData.hasSuccess) {
//    "医疗", "问答", "领养", "签到"
    homeData.data.data.tab = [
      HomeDataTab(title: "医疗", picUrl: "assets/home_page_doctor.png"),
      HomeDataTab(title: "记一笔", picUrl: "assets/home_page_qa.png"),
      HomeDataTab(title: "食谱", picUrl: "assets/home_page_lingyang.png"),
      HomeDataTab(title: "签到", picUrl: "assets/home_page_sign.png")
    ];

    ctx.dispatch(HomeActionCreator.onSetHomeData(homeData.data.data));
  }
}

Future _initState(Action action, Context<HomeState> ctx) async {}
