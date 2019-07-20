import 'dart:ui';

import 'package:chongmeng/global_store/state.dart';
import 'package:chongmeng/helper/model/local_user.dart';
import 'package:fish_redux/fish_redux.dart';

class AccountState implements GlobalBaseState<AccountState> {
  @override
  AccountState clone() {
    return AccountState();
  }

  @override
  LocalUser localUser;

  @override
  Locale locale;

  static AccountState initState(Map<String, dynamic> args) {
    return AccountState();
  }
}
