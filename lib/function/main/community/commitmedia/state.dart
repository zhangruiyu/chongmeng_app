import 'package:dragablegridview_flutter/dragablegridview_flutter.dart';
import 'package:fish_redux/fish_redux.dart';

import 'model/item_bin.dart';

class CommitMediaState implements Cloneable<CommitMediaState> {
  String videoFilePath;
  List<ItemBin> picFilePath;
  EditSwitchController editSwitchController;
  String type;

  @override
  CommitMediaState clone() {
    return CommitMediaState()
      ..videoFilePath = videoFilePath
      ..picFilePath = picFilePath
      ..editSwitchController = editSwitchController
      ..type = type;
  }
}

CommitMediaState initState(Map<String, dynamic> args) {
  var reviewIVState = CommitMediaState()
    ..type = args['type']
    ..editSwitchController = EditSwitchController();
  if (reviewIVState.type == "video") {
    reviewIVState.videoFilePath = args['filePath'];
  } else {
    if (args['filePath'] is String) {
      reviewIVState.picFilePath = [ItemBin(args['filePath'])];
    } else {
      reviewIVState.picFilePath =
          (args['filePath']).map((item) => ItemBin(item)).toList();
    }
  }
  return reviewIVState;
}
