import 'dart:io';

import 'package:dragablegridview_flutter/dragablegridview_flutter.dart';
import 'package:fish_redux/fish_redux.dart';

import 'model/dynamic_selected_pic_task.dart';
import 'package:flutter_video_compress/flutter_video_compress.dart';

class CommitMediaState implements Cloneable<CommitMediaState> {
  String videoFilePath;
  File thumbnailFile;
  List<DynamicSelectedPicTask> picFilePath;
  EditSwitchController editSwitchController;
  String type;

  //视频播放才有
  FlutterVideoCompress flutterVideoCompress;

  @override
  CommitMediaState clone() {
    return CommitMediaState()
      ..videoFilePath = videoFilePath
      ..thumbnailFile = thumbnailFile
      ..picFilePath = picFilePath
      ..editSwitchController = editSwitchController
      ..flutterVideoCompress = flutterVideoCompress
      ..type = type;
  }
}

CommitMediaState initState(Map<String, dynamic> args) {
  var reviewIVState = CommitMediaState()
    ..type = args['type']
    ..editSwitchController = EditSwitchController();
  if (reviewIVState.type == "video") {
    reviewIVState
      ..videoFilePath = args['filePath']
      ..flutterVideoCompress = FlutterVideoCompress()
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
