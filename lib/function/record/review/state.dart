import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class ReviewIVState implements Cloneable<ReviewIVState> {
  String filePath;
  String type;
  File thumbnailFile;
  IjkMediaController videoController;

  @override
  ReviewIVState clone() {
    return ReviewIVState()
      ..filePath = filePath
      ..type = type
      ..thumbnailFile = thumbnailFile
      ..videoController = videoController;
  }
}

ReviewIVState initState(Map<String, dynamic> args) {
  var reviewIVState = ReviewIVState()
    ..filePath = args['filePath']
    ..type = args['type'];
  if (reviewIVState.type == "video") {
    reviewIVState.videoController = IjkMediaController();
    reviewIVState.thumbnailFile = args['thumbnailFile'];
  }
  return reviewIVState;
}
