import 'package:chongmeng/function/main/store/state.dart';
import 'package:fish_redux/fish_redux.dart';

import '../state.dart';

class ItemBodyState implements Cloneable<ItemBodyState> {
  ItemPageData itemPageData;

  @override
  ItemBodyState clone() {
    return ItemBodyState();
  }
}

ConnOp<CommunityState, ItemBodyState> communityBodyConnector(String type) {
  return ConnOp<CommunityState, ItemBodyState>(
    get: (CommunityState state) {
      return ItemBodyState()..itemPageData = state.pageData[type];
    },
    set: (CommunityState state, ItemBodyState subState) {
      state.pageData[type] = subState.itemPageData;
    },
  );
}
