import 'dart:ui';

import 'package:chongmeng/function/main/account/state.dart';
import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:chongmeng/function/main/home/state.dart';
import 'package:chongmeng/global_store/state.dart';
import 'package:chongmeng/helper/model/local_user.dart';
import 'package:fish_redux/fish_redux.dart';

class MainState implements GlobalBaseState<MainState> {
  int mainPageIndex;
  HomeData homeData;

  @override
  MainState clone() {
    return MainState()
      ..mainPageIndex = mainPageIndex
      ..localUser = localUser
      ..locale = locale;
  }

  @override
  LocalUser localUser;

  @override
  Locale locale;
}

MainState initState(Map<String, dynamic> args) {
  return MainState()..mainPageIndex = 0;
}

ConnOp<MainState, AccountState> accountConnector() {
  return ConnOp<MainState, AccountState>(
    get: (MainState state) {
      return AccountState()
        ..localUser = state.localUser
        ..locale = state.locale;
    },
    set: (MainState state, AccountState subState) {
//      state.bannerData = subState.bannerData;
    },
  );
}

ConnOp<MainState, HomeState> homeConnector() {
  return ConnOp<MainState, HomeState>(
    get: (MainState state) {
      return HomeState()..homeData = state.homeData;
    },
    set: (MainState state, HomeState subState) {
      state.homeData = subState.homeData;
    },
  );
}
