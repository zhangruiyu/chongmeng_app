import 'package:fish_redux/fish_redux.dart';

class MyOrderState implements Cloneable<MyOrderState> {

  @override
  MyOrderState clone() {
    return MyOrderState();
  }
}

MyOrderState initState(Map<String, dynamic> args) {
  return MyOrderState();
}
