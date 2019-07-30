import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'model/recipe_entity.dart';
import 'state.dart';

Effect<RecipeState> buildEffect() {
  return combineEffects(<Object, Effect<RecipeState>>{
    RecipeAction.Refresh: _onRefresh,
  });
}

Future _onRefresh(Action action, Context<RecipeState> ctx) async {
  var result =
      await RequestClient.request<RecipeEntity>(ctx.context, HttpConstants.RecipeList);
  action.payload['completer']();
  if (result.hasSuccess) {
    ctx.dispatch(RecipeActionCreator.onRefresh(result.data.data));
  }
}
