import 'package:fish_redux/fish_redux.dart';

class MyPetState implements Cloneable<MyPetState> {

  @override
  MyPetState clone() {
    return MyPetState();
  }
}

MyPetState initState(Map<String, dynamic> args) {
  return MyPetState();
}
