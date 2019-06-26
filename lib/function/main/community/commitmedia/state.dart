import 'package:fish_redux/fish_redux.dart';

class CommitMediaState implements Cloneable<CommitMediaState> {
  String filePath;

  String type;

  @override
  CommitMediaState clone() {
    return CommitMediaState()
      ..filePath = filePath
      ..type = type;
  }
}

CommitMediaState initState(Map<String, dynamic> args) {
  var reviewIVState = CommitMediaState()
    ..filePath = args['filePath']
    ..type = args['type'];
  return reviewIVState;
}
