import 'package:fish_redux/fish_redux.dart';

enum ProductDetailsAction { SetDetailsData, Refresh }

class ProductDetailsActionCreator {
  static Action onSetDetailsData(data) {
    return Action(ProductDetailsAction.SetDetailsData, payload: data);
  }

  static Action onRefresh(data) {
    return Action(ProductDetailsAction.Refresh, payload: data);
  }
}
