import 'package:fish_redux/fish_redux.dart';

class ReplyListState implements Cloneable<ReplyListState> {

  @override
  ReplyListState clone() {
    return ReplyListState();
  }
}

ReplyListState initState(Map<String, dynamic> args) {
  return ReplyListState();
}
