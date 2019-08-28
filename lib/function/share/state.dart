import 'package:fish_redux/fish_redux.dart';

class ShareState implements Cloneable<ShareState> {
  Map<String, dynamic> args;

  @override
  ShareState clone() {
    return ShareState()..args = args;
  }

  static String text = "text";
}

ShareState initState(Map<String, dynamic> args) {
  return ShareState()..args = args;
}
