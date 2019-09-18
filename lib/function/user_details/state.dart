import 'dart:collection';

import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:chongmeng/function/main/community/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'model/user_details_entity.dart';

class UserDetailsState implements Cloneable<UserDetailsState> {
  static final String Main = "Main";
  static final String AlbuAm = "AlbuAm";

  UserDetailsData data;
  TabController tabController;
  LinkedHashMap<String, ItemPageData> pageData;

  @override
  UserDetailsState clone() {
    return UserDetailsState()
      ..data = data
      ..pageData = pageData
      ..tabController = tabController;
  }
}

UserDetailsState initState(Map<String, dynamic> args) {
  return UserDetailsState()
    ..pageData = LinkedHashMap.from({
      UserDetailsState.Main: ItemPageData(
          name: "主页",
          filtrateType: UserDetailsState.Main,
          data: [],
          pageIndex: 0),
      UserDetailsState.AlbuAm: ItemPageData(
          name: "相册",
          filtrateType: UserDetailsState.AlbuAm,
          data: [],
          pageIndex: 0)
    });
}

class UserDetailsPageState extends ComponentState<UserDetailsState>
    with SingleTickerProviderStateMixin {}

class ItemPageData {
  String name;
  String filtrateType;
  int pageIndex;
  List<DynamicListData> data;

  ItemPageData({this.name, this.filtrateType, this.data, this.pageIndex});
}
