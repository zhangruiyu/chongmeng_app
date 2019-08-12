import 'package:fish_redux/fish_redux.dart';

class ReplyState implements Cloneable<ReplyState> {

  @override
  ReplyState clone() {
    return ReplyState();
  }
}

ReplyState initState(Map<String, dynamic> args) {
  return ReplyState();
}
