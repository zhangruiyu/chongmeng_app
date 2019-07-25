import 'package:chongmeng/function/main/home/tab/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'banner/state.dart';
import 'model/home_entity.dart';

class HomeState implements Cloneable<HomeState> {
  HomeData homeData;

  @override
  HomeState clone() {
    return HomeState();
  }

  static HomeState initState(Map<String, dynamic> args) {
    return HomeState();
  }
}

ConnOp<HomeState, BannerState> bannerConnector() {
  return ConnOp<HomeState, BannerState>(
    get: (HomeState state) {
      return BannerState()..bannerData = state.homeData?.banner;
    },
    set: (HomeState state, BannerState subState) {
      throw Exception("不支持改变数据");
    },
  );
}

ConnOp<HomeState, TabState> tabConnector() {
  return ConnOp<HomeState, TabState>(
    get: (HomeState state) {
      return TabState()..tabData = state.homeData?.tab;
    },
    set: (HomeState state, TabState subState) {
      throw Exception("不支持改变数据");
    },
  );
}
