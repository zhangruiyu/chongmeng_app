import 'package:fish_redux/fish_redux.dart';

class AdoptionDetailsState implements Cloneable<AdoptionDetailsState> {

  @override
  AdoptionDetailsState clone() {
    return AdoptionDetailsState();
  }
}

AdoptionDetailsState initState(Map<String, dynamic> args) {
  return AdoptionDetailsState();
}
