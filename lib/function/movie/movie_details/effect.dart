import 'package:chongmeng/components/dynamic/model/item_page_data.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/recipe/state.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/date_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'model/movie_details_entity.dart';
import 'model/movie_schedule_entity.dart';
import 'state.dart';

Effect<MovieDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<MovieDetailsState>>{
    MovieDetailsAction.Refresh: _onRefresh,
    MovieDetailsAction.RefreshSchedule: _onRefreshSchedule,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<MovieDetailsState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as MovieDetailsPageState;
  ctx.state
    ..tabController =
        TabController(vsync: tickerProvider, length: 3, initialIndex: 0);
  ctx.state
    ..tabController.addListener(() {
      ctx.dispatch(MovieDetailsActionCreator.onRefreshSchedule({
        'itemPageData':
            ctx.state.pageData.values.toList()[ctx.state.tabController.index]
      }));
    });
  ctx.dispatch(MovieDetailsActionCreator.onRefresh(null));
  ctx.dispatch(MovieDetailsActionCreator.onRefreshSchedule(
      {'itemPageData': ctx.state.pageData.values.first}));
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

Future<void> _onRefreshSchedule(
    Action action, Context<MovieDetailsState> ctx) async {
  ItemMovieSchedulePageData itemPageData = action.payload['itemPageData'];

  (await RequestClient.request<MovieScheduleEntity>(ctx.context,
          "http://m.maoyan.com/ajax/movie?forceUpdate=${new DateTime.now().millisecondsSinceEpoch}",
          isPost: true,
          queryParameters: {
        "forceUpdate": new DateTime.now().millisecondsSinceEpoch,
        "movieId": ctx.state.itemMovie.id,
        "day": DateUtils.formatData(itemPageData.filtrateType)
      }))
      .yes((value) {
    ctx.dispatch(
        MovieDetailsActionCreator.onSetScheduleData(itemPageData, value));
  });
  CompleterUtils.complete(action);
}
