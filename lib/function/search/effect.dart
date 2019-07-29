import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'model/search_result_entity.dart';
import 'state.dart';

Effect<SearchState> buildEffect() {
  return combineEffects(<Object, Effect<SearchState>>{
    SearchAction.Search: _onSearch,
  });
}

Future _onSearch(Action action, Context<SearchState> ctx) async {
  var result = await RequestClient.request<SearchResultEntity>(
      ctx.context, HttpConstants.AliSearch,
      queryParameters: {"query": ctx.state.textEditingController.text});
  if (result.hasSuccess) {
    ctx.dispatch(SearchActionCreator.onResetData(result.data.data));
  }
}
