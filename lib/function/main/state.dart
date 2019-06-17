import 'package:chongmeng/function/main/account/state.dart';
import 'package:fish_redux/fish_redux.dart';

class MainState implements Cloneable<MainState> {
  int mainPageIndex;

  @override
  MainState clone() {
    return MainState()..mainPageIndex = mainPageIndex;
  }
}

MainState initState(Map<String, dynamic> args) {
  return MainState()..mainPageIndex = 1;
}

ConnOp<MainState, AccountState> accountConnector() {
  return ConnOp<MainState, AccountState>(
    get: (MainState state) {
      return AccountState();
    },
    set: (MainState state, AccountState subState) {
//      state.bannerData = subState.bannerData;
    },
  );
}
