import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class SearchState implements Cloneable<SearchState> {
  List<AliProductItem> data;
  TextEditingController textEditingController;

  @override
  SearchState clone() {
    return SearchState()
      ..data = data
      ..textEditingController = textEditingController;
  }
}

SearchState initState(Map<String, dynamic> args) {
  return SearchState()
    ..data = []
    ..textEditingController = TextEditingController(text: "狗粮");
}
