import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'model/hot_movie_entity.dart';
import 'state.dart';

Effect<MovieState> buildEffect() {
  return combineEffects(<Object, Effect<MovieState>>{
    MovieAction.Refresh: _onRefresh,
  });
}

Future<void> _onRefresh(Action action, Context<MovieState> ctx) async {
  (await RequestClient.request<HotMovieEntity>(
          ctx.context, HttpConstants.MoiveHot))
      .yes((value) {
    ctx.dispatch(MovieActionCreator.onResetData(value.data));
  });
  CompleterUtils.complete(action);
}
