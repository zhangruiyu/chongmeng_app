import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'adapter/state.dart';

class DynamicDetailsState implements Cloneable<DynamicDetailsState> {
  DynamicListData data;
  TextEditingController commentEditingController;

  @override
  DynamicDetailsState clone() {
    return DynamicDetailsState()
      ..data = data
      ..commentEditingController = commentEditingController;
  }
}

DynamicDetailsState initState(Map<String, dynamic> args) {
  return DynamicDetailsState()
    ..data = args['data']
    ..commentEditingController = TextEditingController();
}

class ReplyListConnector extends ConnOp<DynamicDetailsState, ReplyListState> {
  @override
  void set(DynamicDetailsState state, ReplyListState subState) {
//    state.homeData?.recommendProduct = subState.data;
  }

  @override
  ReplyListState get(DynamicDetailsState state) {
//    return ReplyListState()..data = state.homeData?.recommendProduct ?? [];
    return ReplyListState();
  }
}
