import 'package:chongmeng/components/product/component.dart';
import 'package:chongmeng/components/product/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class SearchListAdapter extends DynamicFlowAdapter<SearchListState> {
  SearchListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'product': AliItemProductComponent()
          },
          connector: _SearchListConnector(),
          reducer: buildReducer(),
        );
}

class _SearchListConnector extends ConnOp<SearchListState, List<ItemBean>> {
  @override
  List<ItemBean> get(SearchListState state) {
    if (state.data?.isEmpty == true) {
      return <ItemBean>[];
    }
    return state.data
        .map<ItemBean>((itemData) =>
            ItemBean("product", AliItemProductState(itemData: itemData)))
        .toList();
  }

  @override
  void set(SearchListState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
