import 'package:fish_redux/fish_redux.dart';

class SafeCenterState implements Cloneable<SafeCenterState> {

  @override
  SafeCenterState clone() {
    return SafeCenterState();
  }
}

SafeCenterState initState(Map<String, dynamic> args) {
  return SafeCenterState();
}
