import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:fish_redux/fish_redux.dart';

class SearchListState implements Cloneable<SearchListState> {
  List<AliProductItem> data;

  @override
  SearchListState clone() {
    return SearchListState()..data = data;
  }
}
