import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'model/details_entity.dart';
import 'state.dart';

Effect<ProductDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<ProductDetailsState>>{
    Lifecycle.initState: _initState,
    ProductDetailsAction.Refresh: _onRefresh,
  });
}

Future _onRefresh(Action action, Context<ProductDetailsState> ctx) async {
  var result = await RequestClient.request<DetailsEntity>(
      ctx.context, HttpConstants.CoreProductDetailsPic, queryParameters: {
    'productId': ctx.state.itemData.productId,
    "type": ctx.state.itemData.type
  });
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    ctx.dispatch(ProductDetailsActionCreator.onSetDetailsData(result.data));
  }
}

Future _initState(Action action, Context<ProductDetailsState> ctx) async {
  _onRefresh(action, ctx);
}
