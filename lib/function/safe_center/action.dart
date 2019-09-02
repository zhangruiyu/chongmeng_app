import 'package:fish_redux/fish_redux.dart';

enum SafeCenterAction { QQBind, QQBindBackend, WXBind, WXBindBackend }

class SafeCenterActionCreator {
  static Action onQQBind(bool isBind) {
    return Action(SafeCenterAction.QQBind, payload: isBind);
  }

  static Action onQQBindBackend(bool isBind) {
    return Action(SafeCenterAction.QQBindBackend, payload: isBind);
  }

  static Action onWXBind(bool isBind) {
    return Action(SafeCenterAction.WXBind, payload: isBind);
  }

  static Action onWXBindBackend(bool isBind) {
    return Action(SafeCenterAction.WXBindBackend, payload: isBind);
  }
}
