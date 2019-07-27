import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ProductDetailsAction { action }

class ProductDetailsActionCreator {
  static Action onAction() {
    return const Action(ProductDetailsAction.action);
  }
}
