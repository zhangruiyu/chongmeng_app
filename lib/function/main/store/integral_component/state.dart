import 'package:fish_redux/fish_redux.dart';

class IntegralItemState implements Cloneable<IntegralItemState> {
  var index = 0;

  IntegralItemState({this.index});

  @override
  IntegralItemState clone() {
    return IntegralItemState()..index = index;
  }
}

IntegralItemState initState(Map<String, dynamic> args) {
  return IntegralItemState();
}
