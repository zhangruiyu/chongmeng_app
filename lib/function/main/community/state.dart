import 'dart:collection';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'adapter/state.dart';
import 'model/dynamic_list_entity.dart';

class CommunityState implements Cloneable<CommunityState> {
  TabController tabController;
  LinkedHashMap<int, ItemPageData> pageData;
  EasyRefreshController refreshController;

  @override
  CommunityState clone() {
    return CommunityState()
      ..refreshController = refreshController
      ..tabController = tabController
      ..pageData = pageData;
  }

  static CommunityState initState(Map<String, dynamic> args) {
    return CommunityState()
      ..pageData = LinkedHashMap.from({
        0: ItemPageData(name: "最新", filtrateType: 0, data: [], pageIndex: 0),
        1: ItemPageData(name: "关注", filtrateType: 1, data: [], pageIndex: 0)
      });
  }
}

class CommunityPageState extends ComponentState<CommunityState>
    with SingleTickerProviderStateMixin {}

class ItemPageData {
  String name;
  int filtrateType;
  int pageIndex;
  List<DynamicListData> data;

  ItemPageData({this.name, this.filtrateType, this.data, this.pageIndex});
}

class DynamicListConnector extends ConnOp<CommunityState, DynamicListState> {
  @override
  void set(CommunityState state, DynamicListState subState) {
//    super.set(state, subState);
  }

  @override
  DynamicListState get(CommunityState state) {
    return DynamicListState()..data = state.pageData;
  }
}
