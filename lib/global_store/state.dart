import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

abstract class GlobalBaseState<T extends Cloneable<T>> implements Cloneable<T> {
  Locale get locale;

  set locale(Locale locale);
}

class GlobalState implements GlobalBaseState<GlobalState> {
  @override
  Locale locale;

  @override
  GlobalState clone() {
    return GlobalState(locale: locale);
  }

  GlobalState({this.locale});
}
