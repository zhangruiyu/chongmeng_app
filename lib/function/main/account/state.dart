import 'dart:ui';

import 'package:chongmeng/global_store/state.dart';
import 'package:chongmeng/helper/model/local_user.dart';
import 'package:fish_redux/fish_redux.dart';

class AccountState implements GlobalBaseState<AccountState> {
  //影响内容显示
  int count = 0;

  @override
  AccountState clone() {
    return AccountState()
      ..count = count
      ..localUser = localUser
      ..locale = locale;
  }

  @override
  LocalUser localUser;

  @override
  Locale locale;

  static AccountState initState(Map<String, dynamic> args) {
    return AccountState();
  }
}
