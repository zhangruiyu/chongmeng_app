import 'package:fish_redux/fish_redux.dart';

class ProductDetailsState implements Cloneable<ProductDetailsState> {

  @override
  ProductDetailsState clone() {
    return ProductDetailsState();
  }
}

ProductDetailsState initState(Map<String, dynamic> args) {
  return ProductDetailsState();
}
