import 'dart:ui';

import 'package:chongmeng/helper/model/local_user.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:fish_redux/fish_redux.dart';

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
  var cloneState = state.clone();
  LocalUser loginData = action.payload;
  UserHelper.setLogin(loginData);
  if (cloneState.localUser == null) {
    return cloneState..localUser = loginData;
  }
  return cloneState..localUser = cloneState.localUser.merge(loginData);
}

GlobalState _onLoginOut(GlobalState state, Action action) {
  return state.clone()..localUser = null;
}
