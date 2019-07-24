import 'dart:collection';

import 'package:chongmeng/function/main/community/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class DynamicListState implements Cloneable<DynamicListState> {
  LinkedHashMap<String, ItemPageData> data;
  TabController tabController;

  @override
  DynamicListState clone() {
    return DynamicListState()
      ..data = data
      ..tabController = tabController;
  }
}
