import 'package:fish_redux/fish_redux.dart';

class CommitTextState implements Cloneable<CommitTextState> {

  @override
  CommitTextState clone() {
    return CommitTextState();
  }
}

CommitTextState initState(Map<String, dynamic> args) {
  return CommitTextState();
}
