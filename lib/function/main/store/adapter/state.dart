import 'package:fish_redux/fish_redux.dart';

class IntegralStoreState implements Cloneable<IntegralStoreState> {
  var data;

  @override
  IntegralStoreState clone() {
    return IntegralStoreState();
  }
}

IntegralStoreState initState(Map<String, dynamic> args) {
  return IntegralStoreState();
}
