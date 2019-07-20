import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:fish_redux/fish_redux.dart';

import 'adapter/state.dart';

class StoreState implements Cloneable<StoreState> {
  HomeData storeData;

  get pageData => null;

  @override
  StoreState clone() {
    return StoreState();
  }

  static StoreState initState(Map<String, dynamic> args) {
    return StoreState();
  }
}

class IntegralStoreConnector extends ConnOp<StoreState, IntegralStoreState> {
  @override
  void set(StoreState state, IntegralStoreState subState) {
    super.set(state, subState);
  }

  @override
  IntegralStoreState get(StoreState state) {
    return IntegralStoreState()..data = state.pageData;
  }
}
