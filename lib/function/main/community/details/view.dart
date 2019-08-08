import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:oktoast/oktoast.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    DynamicDetailsState state, Dispatch dispatch, ViewService viewService) {
  var data = state.data;
  List<Widget> content;
  int crossAxisCount;
  /*if (data.images != null && data.images.length > 0) {
    if (data.images.length <= 3) {
      crossAxisCount = 1;
    }
    if (data.images.length == 4) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 3;
    }
    if (data.images.length >= 3) {
      content = buildThreePicView(state, dispatch, viewService);
    } else if (data.images.length == 1) {
      content = buildOnePicView(state, dispatch, viewService);
    } else if (data.images.length == 2) {
      content = buildTwoPicView(state, dispatch, viewService);
    } else {
      content = [Container()];
    }
  } else if (data.video != null) {
    content = buildVideoView(state, dispatch, viewService);
  } else {
    content = [
      Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Text(data.content, maxLines: 5, overflow: TextOverflow.ellipsis),
      )
    ];
  }*/
  return Scaffold(
    appBar: Toolbar(
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              showToast("已举报");
            },
            child: Container(
              alignment: Alignment.center,
              child: Text("举报"),
            ),
          ),
        )
      ],
    ),
    body: EasyRefresh.custom(
      slivers: <Widget>[
        SliverGrid.count(
          crossAxisCount: crossAxisCount,
          children: <Widget>[],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[],
          ),
        )
      ],
    ),
  );
}

buildItemPic(itemImage) {
  return GestureDetector(
    onTap: () {
//      dispatch(DynamicItemActionCreator.onSkipReviewPage(
//          index));
    },
    child: new CachedNetworkImage(
      fit: BoxFit.cover,
      width: double.infinity,
      imageUrl: itemImage,
    ),
  );
}
