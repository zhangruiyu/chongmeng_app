import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:fish_redux/fish_redux.dart';

enum AdoptionAddAction { ChangeSelectPic, ReselectPic }

class AdoptionAddActionCreator {
  static Action onChangeSelectPic(List<UploadTask> list) {
    return Action(AdoptionAddAction.ChangeSelectPic, payload: list);
  }

  static Action onReselectPic() {
    return const Action(AdoptionAddAction.ReselectPic);
  }
}
