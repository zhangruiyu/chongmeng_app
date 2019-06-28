import 'dart:io';

import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter_multiple_image_picker/flutter_multiple_image_picker.dart';

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
    List resultList =
        await FlutterMultipleImagePicker.pickMultiImages(9, false);
//    File images = await ImagePicker.pickImages(
//        source: ImageSource.camera, numberOfItems: 9);

//    Navigator.popAndPushNamed(ctx.context, PageConstants.CommitMediaPage,
//        arguments: {'filePath': resultList, 'type': 'image'});
  } else if (type == "article") {}
}
