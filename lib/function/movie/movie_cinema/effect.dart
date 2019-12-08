import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/movie/model/movie_params_entity.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'model/cinema_movies_entity.dart';
import 'state.dart';

Effect<MovieCinemaState> buildEffect() {
  return combineEffects(<Object, Effect<MovieCinemaState>>{
    Lifecycle.initState: _initState,
    MovieCinemaAction.RefreshMovies: _onRefreshMovies,
  });
}

void _initState(Action action, Context<MovieCinemaState> ctx) {
  ctx.dispatch(MovieCinemaActionCreator.onRefreshMovies());
}

Future<void> _onRefreshMovies(
    Action action, Context<MovieCinemaState> ctx) async {
  (await RequestClient.request<MovieParamsEntity>(
          ctx.context, HttpConstants.movieParams,
          queryParameters: {
        'urlSuffix': "cinemaDetail",
        "ci": GlobalStore.store.getState().ci,
        "ciName": GlobalStore.store.getState().ciName,
      }))
      .yes((paramsData) async {
    (await RequestClient.request<CinemaMoviesEntity>(
            ctx.context, paramsData.data.url,
            isPost: paramsData.data.isPost,
            header: paramsData.data.headers,
            queryParameters: {
          ...paramsData.data.params,
          "cinemaId": ctx.state.movieScheduleData.id,
          "movieId": ctx.state.movieId,
        }))
        .yes((value) {
      ctx.dispatch(MovieCinemaActionCreator.onSetRefreshMovies(value));
      Future.delayed(Duration(milliseconds: 200)).then((onValue) {
        ctx.dispatch(MovieCinemaActionCreator.onChangeMovieIndex(value
            .showData.movies
            .indexWhere((itemMovie) => itemMovie.id == ctx.state.movieId)));
      });
    });
  });
}
