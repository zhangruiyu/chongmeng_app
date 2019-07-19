import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum IntegralCommodityDetailAction { action }

class IntegralCommodityDetailActionCreator {
  static Action onAction() {
    return const Action(IntegralCommodityDetailAction.action);
  }
}
