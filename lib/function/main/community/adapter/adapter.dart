import 'package:chongmeng/function/main/community/dynamic_component/component.dart';
import 'package:chongmeng/function/main/community/dynamic_component/state.dart';
import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:oktoast/oktoast.dart';

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
    println("index  ${state.tabController?.index?.toString()}");
    if (state.tabController == null) {
      return <ItemBean>[];
    }
    var data =
        state.data[state.data.keys.toList()[state.tabController.index]].data;
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
  void set(DynamicListState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
