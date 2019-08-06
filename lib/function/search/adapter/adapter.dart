import 'package:chongmeng/components/product/component.dart';
import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'reducer.dart';

class SearchListAdapter extends DynamicFlowAdapter<SearchState> {
  SearchListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'product': AliItemProductComponent()
          },
          connector: _SearchListConnector(),
          reducer: buildReducer(),
        );
}

class _SearchListConnector extends ConnOp<SearchState, List<ItemBean>> {
  @override
  List<ItemBean> get(SearchState state) {
    if (state.data?.isEmpty == true) {
      return <ItemBean>[];
    }
    return state.data
        .map<ItemBean>(
            (AliProductItem itemData) => ItemBean("product", itemData))
        .toList(growable: true);
  }

  @override
  void set(SearchState state, List<ItemBean> items) {
    /*if (items?.isNotEmpty == true) {
      state.data = List<ToDoState>.from(
          toDos.map<ToDoState>((ItemBean bean) => bean.data).toList());
    } else {
      state.toDos = <ToDoState>[];
    }*/
  }

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
