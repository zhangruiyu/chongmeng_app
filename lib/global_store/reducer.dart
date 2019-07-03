import 'dart:ui';

import 'package:chongmeng/function/auto/model/login_entity.dart';
import 'package:chongmeng/helper/model/local_user.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.ChangeLanguage: _onChangeLanguage,
      GlobalAction.UpdateLocalUser: _onUpdateLocalUser,
      GlobalAction.LoginOut: _onLoginOut,
    },
  );
}

GlobalState _onChangeLanguage(GlobalState state, Action action) {
  return state.clone()..locale = Locale('en', 'US');
}

GlobalState _onUpdateLocalUser(GlobalState state, Action action) {
  LoginData loginData = action.payload;
  UserHelper.setLogin(loginData);
  return state.clone()..localUser = LocalUser.fromJson(loginData.toJson());
}

GlobalState _onLoginOut(GlobalState state, Action action) {
  return state.clone()..localUser = null;
}
