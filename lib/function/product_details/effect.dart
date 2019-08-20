import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'model/details_entity.dart';
import 'state.dart';

Effect<ProductDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<ProductDetailsState>>{
    Lifecycle.initState: _initState,
  });
}

void _onAction(Action action, Context<ProductDetailsState> ctx) {}

Future _initState(Action action, Context<ProductDetailsState> ctx) async {
  var result = await RequestClient.request<DetailsEntity>(
      ctx.context, HttpConstants.CoreProductDetailsPic, queryParameters: {
    'productId': ctx.state.itemData.productId,
    "type": ctx.state.itemData.type
  });
  if (result.hasSuccess) {
    ctx.dispatch(ProductDetailsActionCreator.onSetDetailsData(result.data));
  }
}
