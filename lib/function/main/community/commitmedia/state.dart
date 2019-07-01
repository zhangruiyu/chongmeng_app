import 'dart:io';

import 'package:dragablegridview_flutter/dragablegridview_flutter.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'model/dynamic_selected_pic_task.dart';

class CommitMediaState implements Cloneable<CommitMediaState> {
  String videoFilePath;
  File thumbnailFile;
  List<DynamicSelectedPicTask> picFilePath;
  EditSwitchController editSwitchController;
  TextEditingController contentTextEditingController;
  String type;

  @override
  CommitMediaState clone() {
    return CommitMediaState()
      ..videoFilePath = videoFilePath
      ..thumbnailFile = thumbnailFile
      ..picFilePath = picFilePath
      ..editSwitchController = editSwitchController
      ..contentTextEditingController = contentTextEditingController
      ..type = type;
  }
}

CommitMediaState initState(Map<String, dynamic> args) {
  var reviewIVState = CommitMediaState()
    ..type = args['type']
    ..editSwitchController = EditSwitchController()
    ..contentTextEditingController = TextEditingController();
  if (reviewIVState.type == "video") {
    reviewIVState
      ..videoFilePath = args['filePath']
      ..thumbnailFile = args['thumbnailFile'];
  } else {
    if (args['filePath'] is String) {
      reviewIVState..picFilePath = [DynamicSelectedPicTask(args['filePath'])];
    } else {
      reviewIVState.picFilePath = (args['filePath'] as List).map((item) {
        return DynamicSelectedPicTask(item);
      }).toList();
    }
  }
  return reviewIVState;
}
