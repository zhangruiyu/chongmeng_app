import 'package:fish_redux/fish_redux.dart';

enum UploadImageAction { action }

class UploadImageActionCreator {
  static Action onAction() {
    return const Action(UploadImageAction.action);
  }
}
