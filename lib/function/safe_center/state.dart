import 'package:fish_redux/fish_redux.dart';

class SafeCenterState implements Cloneable<SafeCenterState> {
  bool qqBind;
  bool wxBind;

  @override
  SafeCenterState clone() {
    return SafeCenterState()
      ..qqBind = qqBind
      ..wxBind = wxBind;
  }
}

SafeCenterState initState(Map<String, dynamic> args) {
  return SafeCenterState()
    ..qqBind = false
    ..wxBind = false;
}
