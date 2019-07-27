import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ProductDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<ProductDetailsState>>{
    ProductDetailsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ProductDetailsState> ctx) {
}
