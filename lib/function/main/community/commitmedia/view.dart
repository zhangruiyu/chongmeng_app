import 'dart:io';

import 'package:chongmeng/function/main/community/commitmedia/model/dynamic_selected_pic_task.dart';
import 'package:chongmeng/utils/window_utils.dart';
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

  List<Widget> gridItems = new List<Widget>();

  double itemWidth = WindowUtils.getScreenWidth() / 5.toDouble();
  List<DynamicSelectedPicTask> selectedPics = state.picFilePath;
  if (!isVideo) {
    selectedPics.forEach((DynamicSelectedPicTask selectedPic) {
      selectedPic.sequence = selectedPics.indexOf(selectedPic);
      Widget item = new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Image.file(
          new File(selectedPic.localUrl.toString()),
          fit: BoxFit.fitWidth,
          width: itemWidth,
          height: itemWidth,
        ),
      );
      gridItems.add(item);
    });
    if (state.picFilePath.length < 9) {
      gridItems.add(new IconButton(
          icon: new Icon(
            Icons.add_a_photo,
            size: 30.0,
            color: const Color(0x40808080),
          ),
          onPressed: () {
            dispatch(CommitMediaActionCreator.onReselectPic());
          }));
    }
  } else {}

  return Scaffold(
    appBar: Toolbar(
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              dispatch(CommitMediaActionCreator.onUploadCommit());
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
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                children: gridItems,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
