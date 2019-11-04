import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'model/movie_details_entity.dart';
import 'state.dart';

Effect<MovieDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<MovieDetailsState>>{
    MovieDetailsAction.Refresh: _onRefresh,
  });
}

Future<void> _onRefresh(Action action, Context<MovieDetailsState> ctx) async {
  var itemMovie = ctx.state.itemMovie;
  (await RequestClient.request<MovieDetailsEntity>(ctx.context,
          "http://m.maoyan.com/ajax/detailmovie?movieId=${itemMovie.id}",
          isPost: false))
      .yes((value) {
    ctx.dispatch(MovieDetailsActionCreator.onSetDetailsData(value.detailMovie));
  });
  CompleterUtils.complete(action);
}
