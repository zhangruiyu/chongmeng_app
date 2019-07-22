import 'package:chongmeng/function/main/community/dynamic_component/component.dart';
import 'package:chongmeng/function/main/community/dynamic_component/state.dart';
import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class DynamicListAdapter extends DynamicFlowAdapter<DynamicListState> {
  DynamicListAdapter()
      : super(
          pool: <String, Component<Object>>{'dynamic': DynamicItemComponent()},
          connector: _DynamicListConnector(),
          reducer: buildReducer(),
        );
}

class _DynamicListConnector extends ConnOp<DynamicListState, List<ItemBean>> {
  @override
  List<ItemBean> get(DynamicListState state) {
    if (state.data?.isNotEmpty == true) {
      return state.data[0].data
          .map<ItemBean>((DynamicListData data) =>
              ItemBean('dynamic', DynamicItemState(data: data)))
          .toList(growable: true);
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(DynamicListState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
