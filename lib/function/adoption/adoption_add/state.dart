import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:fish_redux/fish_redux.dart';

class AdoptionAddState implements Cloneable<AdoptionAddState> {
  List<UploadTask> selectPicList;

  @override
  AdoptionAddState clone() {
    return AdoptionAddState()..selectPicList = selectPicList;
  }
}

AdoptionAddState initState(Map<String, dynamic> args) {
  return AdoptionAddState();
}
