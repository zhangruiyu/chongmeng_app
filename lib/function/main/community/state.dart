import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'model/dynamic_list_entity.dart';

class CommunityState implements Cloneable<CommunityState> {
  TabController tabController;
  List<ItemPageData> pageData;

  @override
  CommunityState clone() {
    return CommunityState()
      ..tabController = tabController
      ..pageData = pageData;
  }

  static CommunityState initState(Map<String, dynamic> args) {
    return CommunityState()
      ..pageData = [
        ItemPageData(name: "最新", filtrateType: 0, data: []),
        ItemPageData(name: "关注", filtrateType: 1, data: [])
      ];
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
