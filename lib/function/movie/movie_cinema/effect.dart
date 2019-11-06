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
  (await RequestClient.request<CinemaMoviesEntity>(
          ctx.context, "http://m.maoyan.com/ajax/cinemaDetail",
          isPost: false,
          header: {
        "User-Agent":
            "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Mobile Safari/537.36",
        "Cookie":
            "uuid_n_v=v1; iuuid=6DAD8D70EFCF11E99BB4958E7854CCC30FD710A1C9C7476CB9250F488C1CC891; webp=true; ci=1%2C%E5%8C%97%E4%BA%AC; _lxsdk_cuid=16dd2e642a9c8-0452f7ff49e1fc-38677b00-1fa400-16dd2e642a9c8; _lx_utm=utm_source%3DBaidu%26utm_medium%3Dorganic; __mta=213744555.1571201368900.1572594052897.1572594068032.7; _lxsdk=6DAD8D70EFCF11E99BB4958E7854CCC30FD710A1C9C7476CB9250F488C1CC891; __mta=213744555.1571201368900.1572594068032.1572839609122.8; _last_page=c_76cEz; from=canary; _lxsdk_s=16e3f7b17f8-cc7-fda-b4d%7C%7C10"
      },
          queryParameters: {
        "cinemaId": ctx.state.movieScheduleData.id,
        "movieId": ctx.state.movieId,
      }))
      .yes((value) {
    ctx.dispatch(MovieCinemaActionCreator.onSetRefreshMovies(value));
  });
}
