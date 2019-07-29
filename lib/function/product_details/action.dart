import 'package:fish_redux/fish_redux.dart';

enum ProductDetailsAction { action, Refresh }

class ProductDetailsActionCreator {
  static Action onAction() {
    return const Action(ProductDetailsAction.action);
  }

  static Action onRefresh(data) {
    return Action(ProductDetailsAction.Refresh, payload: data);
  }
}
