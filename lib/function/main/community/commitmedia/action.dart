import 'package:fish_redux/fish_redux.dart';

enum CommitMediaAction { ChangeSelectPic, UploadCommit, ReselectPic }

class CommitMediaActionCreator {
  static Action onChangeSelectPic(data) {
    return Action(CommitMediaAction.ChangeSelectPic, payload: data);
  }

  static Action onUploadCommit() {
    return const Action(CommitMediaAction.UploadCommit);
  }

  static Action onReselectPic() {
    return const Action(CommitMediaAction.ReselectPic);
  }
}
