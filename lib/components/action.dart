import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UploadImageAction { action }

class UploadImageActionCreator {
  static Action onAction() {
    return const Action(UploadImageAction.action);
  }
}
