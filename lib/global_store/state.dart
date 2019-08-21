import 'dart:ui';

import 'package:chongmeng/helper/model/local_user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:package_info/package_info.dart';

abstract class GlobalBaseState<T extends Cloneable<T>> implements Cloneable<T> {
  Locale get locale;

  set locale(Locale locale);

  LocalUser get localUser;

  set localUser(LocalUser localUser);
}

class GlobalState implements GlobalBaseState<GlobalState> {
  @override
  Locale locale;

  @override
  LocalUser localUser;
  PackageInfo packageInfo;
  String channel;

  @override
  GlobalState clone() {
    return GlobalState()
      ..channel = channel
      ..packageInfo = packageInfo
      ..locale = locale
      ..localUser = localUser;
  }
}
