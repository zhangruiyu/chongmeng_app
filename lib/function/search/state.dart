import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

import 'adapter/state.dart';

class SearchState implements Cloneable<SearchState> {
  List<AliProductItem> data;
  TextEditingController textEditingController;
  var index;

  @override
  SearchState clone() {
    return SearchState()
      ..index = index
      ..data = data
      ..textEditingController = textEditingController;
  }
}

SearchState initState(Map<String, dynamic> args) {
  return SearchState()
    ..data = []
    ..index = 1
    ..textEditingController = TextEditingController(text: "狗粮");
}

class SearchListConnector extends ConnOp<SearchState, SearchListState> {
  @override
  void set(SearchState state, SearchListState subState) {
//    super.set(state, subState);
  }

  @override
  SearchListState get(SearchState state) {
    return SearchListState()..data = state.data ?? [];
  }
}
