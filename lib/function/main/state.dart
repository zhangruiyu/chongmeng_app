import 'dart:ui';

import 'package:chongmeng/function/main/account/state.dart';
import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:chongmeng/function/main/home/state.dart';
import 'package:chongmeng/function/main/store/state.dart';
import 'package:chongmeng/global_store/state.dart';
import 'package:chongmeng/helper/model/local_user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

import 'community/state.dart';

class MainState implements GlobalBaseState<MainState> {
  int mainPageIndex;
  HomeState homeState;
  CommunityState communityState;
  AccountState accountState;
  StoreState storeState;
  List<Widget> views;

  @override
  MainState clone() {
    return MainState()
      ..mainPageIndex = mainPageIndex
      ..localUser = localUser
      ..locale = locale
      ..views = views
      ..storeState = storeState
      ..communityState = communityState
      ..accountState = accountState
      ..homeState = homeState;
  }

  @override
  LocalUser localUser;

  @override
  Locale locale;
}

MainState initState(Map<String, dynamic> args) {
  return MainState()
    ..mainPageIndex = 0
    ..communityState = CommunityState.initState(args)
    ..storeState = StoreState.initState(args)
    ..accountState = AccountState.initState(args)
    ..homeState = HomeState.initState(args);
}

ConnOp<MainState, AccountState> accountConnector() {
  return ConnOp<MainState, AccountState>(
    get: (MainState state) {
      return state.accountState.clone();
    },
    set: (MainState state, AccountState subState) {
      state.accountState = subState;
    },
  );
}

ConnOp<MainState, CommunityState> communityConnector() {
  return ConnOp<MainState, CommunityState>(
    get: (MainState state) {
      return state.communityState.clone();
    },
    set: (MainState state, CommunityState subState) {
      state.communityState = subState;
    },
  );
}

ConnOp<MainState, HomeState> homeConnector() {
  return ConnOp<MainState, HomeState>(
    get: (MainState state) {
      return state.homeState.clone();
    },
    set: (MainState state, HomeState subState) {
      state.homeState = subState;
    },
  );
}

ConnOp<MainState, StoreState> storeConnector() {
  return ConnOp<MainState, StoreState>(
    get: (MainState state) {
      return state.storeState.clone();
    },
    set: (MainState state, StoreState subState) {
      state.storeState = subState;
    },
  );
}
