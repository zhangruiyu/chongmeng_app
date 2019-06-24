import 'package:fish_redux/fish_redux.dart';

enum RecordAction { RefreshPage }

class RecordActionCreator {
  static Action onRefreshPage() {
    return const Action(RecordAction.RefreshPage);
  }
}
