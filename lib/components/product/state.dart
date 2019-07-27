import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:fish_redux/fish_redux.dart';

class AliItemProductState implements Cloneable<AliItemProductState> {
  AliProductItem itemData;

  AliItemProductState({this.itemData});

  @override
  AliItemProductState clone() {
    return AliItemProductState()..itemData = itemData;
  }
}

AliItemProductState initState(Map<String, dynamic> args) {
  return AliItemProductState();
}
