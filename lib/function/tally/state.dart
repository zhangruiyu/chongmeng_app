import 'package:fish_redux/fish_redux.dart';

class TallyState implements Cloneable<TallyState> {

  @override
  TallyState clone() {
    return TallyState();
  }
}

TallyState initState(Map<String, dynamic> args) {
  return TallyState();
}
