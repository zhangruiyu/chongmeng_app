import 'package:fish_redux/fish_redux.dart';

class AdoptionState implements Cloneable<AdoptionState> {

  @override
  AdoptionState clone() {
    return AdoptionState();
  }
}

AdoptionState initState(Map<String, dynamic> args) {
  return AdoptionState();
}
