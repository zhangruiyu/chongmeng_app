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
