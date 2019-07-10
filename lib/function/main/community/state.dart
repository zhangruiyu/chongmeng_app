import 'dart:collection';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_easyrefresh/easy_refresh.dart';

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
        0: ItemPageData(name: "最新", filtrateType: 0, data: []),
        1: ItemPageData(name: "关注", filtrateType: 1, data: [])
      });
  }
}

class CommunityPageState extends ComponentState<CommunityState>
    with SingleTickerProviderStateMixin {}

class ItemPageData {
  String name;
  int filtrateType;
  List<DynamicListData> data;

  ItemPageData({this.name, this.filtrateType, this.data});
}
