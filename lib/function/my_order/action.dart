import 'package:fish_redux/fish_redux.dart';

import 'model/my_order_entity.dart';

enum MyOrderAction { ResetPageData, Refresh }

class MyOrderActionCreator {
  static Action onResetPageData(List<MyOrderData> data) {
    return Action(MyOrderAction.ResetPageData, payload: data);
  }

  static Action onRefresh(Map<String, dynamic> map) {
    return Action(MyOrderAction.Refresh, payload: map);
  }
}