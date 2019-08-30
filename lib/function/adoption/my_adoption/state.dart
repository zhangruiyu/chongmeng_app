import 'package:fish_redux/fish_redux.dart';

import 'model/my_adoption_entity.dart';

class MyAdoptionState implements Cloneable<MyAdoptionState> {
  MyAdoptionData data;

  @override
  MyAdoptionState clone() {
    return MyAdoptionState()..data = data;
  }
}

MyAdoptionState initState(Map<String, dynamic> args) {
  return MyAdoptionState();
}
