import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'action.dart';
import 'state.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

Effect<SelectTalkTypeState> buildEffect() {
  return combineEffects(<Object, Effect<SelectTalkTypeState>>{
    SelectTalkTypeAction.SkipPage: _onSkipPage,
  });
}

Future _onSkipPage(Action action, Context<SelectTalkTypeState> ctx) async {
  String type = action.payload;
  if (type == "camera") {
    NavigatorHelper.pushRecordPage(ctx.context);
  } else if (type == "album") {
    List<Asset> resultList = await MultiImagePicker.pickImages(
      maxImages: 9,
      enableCamera: true,
      cupertinoOptions: CupertinoOptions(
//        backgroundColor: currentColorValue,
//        selectionFillColor: currentColorValue,
//        takePhotoIcon: "chat",
          ),
      materialOptions: MaterialOptions(
//        actionBarColor: currentColorValue,
//        statusBarColor: currentColorValue,
//        actionBarTitle: "选择图片",
//        allViewTitle: "所有图片",
          ),
    );
    Navigator.popAndPushNamed(ctx.context, PageConstants.CommitMediaPage,
        arguments: {'filePath': resultList, 'type': 'image'});
  } else if (type == "article") {}
}
