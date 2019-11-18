import 'package:fish_redux/fish_redux.dart';

import 'model/my_order_entity.dart';

enum MyOrderAction {
  ResetPageData,
  Refresh,
  SkipReviewPage,
  ShowOrderAddress,
  ShowExpress
}

class MyOrderActionCreator {
  static Action onResetPageData(MyOrderData data) {
    return Action(MyOrderAction.ResetPageData, payload: data);
  }

  static Action onRefresh(Map<String, dynamic> map) {
    return Action(MyOrderAction.Refresh, payload: map);
  }

  static Action onSkipReviewPage(MyOrderDataStoreorder virtualProduct) {
    return Action(MyOrderAction.SkipReviewPage, payload: virtualProduct);
  }

  static Action onShowOrderAddress(MyOrderDataStoreorder virtualProduct) {
    return Action(MyOrderAction.ShowOrderAddress, payload: virtualProduct);
  }

  static Action onShowExpress(MyOrderDataStoreorder orderData) {
    return Action(MyOrderAction.ShowExpress, payload: orderData);
  }
}
