import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:fish_redux/fish_redux.dart';

class ProductDetailsState implements Cloneable<ProductDetailsState> {
  AliProductItem itemData;

  ProductDetailsState({this.itemData});

  @override
  ProductDetailsState clone() {
    return ProductDetailsState()..itemData = itemData;
  }
}

ProductDetailsState initState(Map<String, dynamic> args) {
  return ProductDetailsState(itemData: args['data']);
}
