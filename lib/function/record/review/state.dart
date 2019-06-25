import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class ReviewIVState implements Cloneable<ReviewIVState> {
  String filePath;
  String type;
  IjkMediaController videoController;

  @override
  ReviewIVState clone() {
    return ReviewIVState()
      ..filePath = filePath
      ..type = type
      ..videoController = videoController;
  }
}

ReviewIVState initState(Map<String, dynamic> args) {
  var reviewIVState = ReviewIVState()
    ..filePath = args['filePath']
    ..type = args['type'];
  if (reviewIVState.type == "video") {
    reviewIVState.videoController = IjkMediaController();
  }
  return reviewIVState;
}
