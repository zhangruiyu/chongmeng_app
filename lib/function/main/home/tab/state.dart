import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class TabState implements Cloneable<TabState> {
  List<HomeDataTab> tabData;

  @override
  TabState clone() {
    return TabState();
  }
}

TabState initState(Map<String, dynamic> args) {
  return TabState();
}
