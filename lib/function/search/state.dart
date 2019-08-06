import 'dart:math';

import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class SearchState implements Cloneable<SearchState> {
  List<AliProductItem> data;
  TextEditingController textEditingController;
  var index;
  int pageState;
  List<List<String>> recommendChip;

  @override
  SearchState clone() {
    return SearchState()
      ..index = index
      ..pageState = pageState
      ..data = data
      ..recommendChip = recommendChip
      ..textEditingController = textEditingController;
  }

  static int INIT = 0;
  static int EMPTY = 1;
  static int HASDATA = 2;
}

SearchState initState(Map<String, dynamic> args) {
  var searchState = SearchState();
  if (args?.containsKey('initChip') == true) {
    searchState.recommendChip = args['initChip'];
  } else {
    searchState.recommendChip = [
      ["狗粮", "狗零食", "狗玩具", "狗窝"],
      ["猫粮", "猫零食", "猫玩具", "猫窝"]
    ];
  }
  List<String> keys = [];
  searchState.recommendChip.forEach((item) {
    keys.addAll(item);
  });
  var rng = new Random();
  return searchState
    ..data = []
    ..index = 1
    ..pageState = SearchState.INIT
    ..textEditingController =
        TextEditingController(text: keys[rng.nextInt(keys.length - 1)]);
}
