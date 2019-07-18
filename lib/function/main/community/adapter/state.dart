import 'dart:collection';

import 'package:chongmeng/function/main/community/state.dart';
import 'package:fish_redux/fish_redux.dart';

class DynamicListState implements Cloneable<DynamicListState> {
  LinkedHashMap<int, ItemPageData> data;

  @override
  DynamicListState clone() {
    return DynamicListState()..data = data;
  }
}

DynamicListState initState(Map<String, dynamic> args) {
  return DynamicListState();
}
