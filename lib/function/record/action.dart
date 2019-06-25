import 'package:fish_redux/fish_redux.dart';

enum RecordAction { RefreshPage, CameraSwitched }

class RecordActionCreator {
  static Action onRefreshPage() {
    return const Action(RecordAction.RefreshPage);
  }

  static Action onCameraSwitched() {
    return const Action(RecordAction.CameraSwitched);
  }
}
