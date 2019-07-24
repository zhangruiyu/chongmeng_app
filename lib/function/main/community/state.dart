import 'dart:collection';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'adapter/state.dart';
import 'model/dynamic_list_entity.dart';

class CommunityState implements Cloneable<CommunityState> {
  TabController tabController;
  LinkedHashMap<String, ItemPageData> pageData;
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
        "NewType": ItemPageData(
            name: "最新", filtrateType: "NewType", data: [], pageIndex: 0),
        "VideoType": ItemPageData(
            name: "视频", filtrateType: "VideoType", data: [], pageIndex: 0)
      });
  }
}

class CommunityPageState extends ComponentState<CommunityState>
    with SingleTickerProviderStateMixin {}

class ItemPageData {
  String name;
  String filtrateType;
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
    return DynamicListState()
      ..data = state.pageData
      ..tabController = state.tabController;
  }
}
