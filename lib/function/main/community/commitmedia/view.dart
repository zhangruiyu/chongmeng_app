import 'dart:io';

import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:dragablegridview_flutter/dragablegridview_flutter.dart';
import 'package:dragablegridview_flutter/dragablegridviewbin.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    CommitMediaState state, Dispatch dispatch, ViewService viewService) {
  int gridCount = 3;
  //是否是视频
  bool isVideo = state.type == "video";
  int size =
      (MediaQuery.of(viewService.context).size.width / gridCount).floor() -
          (18 - gridCount);
  return Scaffold(
    appBar: Toolbar(
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
//              state.editSwitchController.editStateChanged();
            },
            child: Container(
              alignment: Alignment.center,
              child: Text("发布"),
            ),
          ),
        )
      ],
    ),
    body: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                    hintText: "分享你的故事", border: InputBorder.none),
              ),
            ),
            Container(
              height: MediaQuery.of(viewService.context).size.width /
                  gridCount *
                  (state.picFilePath.length / gridCount).ceil(),
              child: DragAbleGridView(
                childAspectRatio: 1,
                crossAxisCount: gridCount,
                itemBins: state.picFilePath,
                editSwitchController: state.editSwitchController,
                isOpenDragAble: true,
                animationDuration: 300,
                longPressDuration: 500,
                deleteIcon: Container(
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent,
                  ),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 10.0 + 16 * (1 / gridCount),
                  ),
                ),
                child: (int position) {
                  var itemData = state.picFilePath[position].data;
                  return Container(
                    margin: EdgeInsets.all(4.0),
                    padding: EdgeInsets.zero,
                    //itemData is String 判断是不是本地图片
                    child: Image.file(
                      File(itemData),
                      fit: BoxFit.fitWidth,
                      width: size.toDouble(),
                      height: size.toDouble(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
