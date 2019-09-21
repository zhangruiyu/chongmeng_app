import 'package:chongmeng/components/dynamic/dynamic_component/component.dart';
import 'package:chongmeng/components/dynamic/dynamic_component/state.dart';
import 'package:chongmeng/function/main/community/item_body/state.dart';
import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:oktoast/oktoast.dart';

import 'reducer.dart';

class DynamicListAdapter extends DynamicFlowAdapter<ItemBodyState> {
  DynamicListAdapter()
      : super(
          pool: <String, Component<Object>>{'dynamic': DynamicItemComponent()},
          connector: _DynamicListConnector(),
          reducer: buildReducer(),
        );
}

class _DynamicListConnector extends ConnOp<ItemBodyState, List<ItemBean>> {
  @override
  List<ItemBean> get(ItemBodyState state) {
    if (state.itemPageData == null) {
      return <ItemBean>[];
    }
    var data = state.itemPageData.data;
    if (data?.isNotEmpty == true) {
      return data
          .map<ItemBean>((DynamicListData data) =>
              ItemBean('dynamic', DynamicItemState(data: data)))
          .toList(growable: true);
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(ItemBodyState state, List<ItemBean> items) {
    state.itemPageData.data = items
        .map<DynamicListData>(
            (ItemBean item) => (item.data as DynamicItemState).data)
        .toList();
  }

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
