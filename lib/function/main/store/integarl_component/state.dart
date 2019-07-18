import 'package:fish_redux/fish_redux.dart';

class IntegralItemState implements Cloneable<IntegralItemState> {

  @override
  IntegralItemState clone() {
    return IntegralItemState();
  }
}

IntegralItemState initState(Map<String, dynamic> args) {
  return IntegralItemState();
}
