import 'dart:io';

import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

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
    Map<String, String> file = await FilePicker.getMultiFilePath(
        type: FileType
            .ANY); // will return a File object directly from the selected file
    println(file);
//    File images = await ImagePicker.pickImages(
//        source: ImageSource.camera, numberOfItems: 9);
    if ((file?.length ?? 0) > 0) {
      Navigator.popAndPushNamed(ctx.context, PageConstants.CommitMediaPage,
          arguments: {'filePath': file.values.toList(), 'type': 'image'});
    }
  } else if (type == "article") {
    Navigator.popAndPushNamed(ctx.context, PageConstants.CommitTextPage);
  }
}
