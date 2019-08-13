import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'adapter/state.dart';
import 'model/comment_entity.dart';

class DynamicDetailsState implements Cloneable<DynamicDetailsState> {
  DynamicListData data;

  //评论
  List<CommentData> commentData;
  String selectPic;
  FocusNode commentNode;

  //回复的评论id
  ReplyInfo replyInfo;
  TextEditingController commentEditingController;

  @override
  DynamicDetailsState clone() {
    return DynamicDetailsState()
      ..data = data
      ..selectPic = selectPic
      ..commentData = commentData
      ..replyInfo = replyInfo
      ..commentNode = commentNode
      ..commentEditingController = commentEditingController;
  }
}

DynamicDetailsState initState(Map<String, dynamic> args) {
  return DynamicDetailsState()
    ..data = args['data']
    ..commentNode = FocusNode()
    ..commentEditingController = TextEditingController();
}

class ReplyListConnector extends ConnOp<DynamicDetailsState, ReplyListState> {
  @override
  void set(DynamicDetailsState state, ReplyListState subState) {
//    state.homeData?.recommendProduct = subState.data;
  }

  @override
  ReplyListState get(DynamicDetailsState state) {
    return ReplyListState()..data = state.commentData;
  }
}

class ReplyInfo {
  num replyId;
  String userName;

  ReplyInfo({this.replyId, this.userName});
}
