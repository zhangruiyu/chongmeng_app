import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:oktoast/oktoast.dart';

import 'action.dart';
import 'model/movie_order_entity.dart';
import 'model/seat_entity.dart';
import 'state.dart';

Effect<MovieSeatState> buildEffect() {
  return combineEffects(<Object, Effect<MovieSeatState>>{
    Lifecycle.initState: _initState,
    MovieSeatAction.Commit: _onCommit,
  });
}

Future<void> _initState(Action action, Context<MovieSeatState> ctx) async {
  (await RequestClient.request<SeatEntity>(ctx.context,
          "http://m.maoyan.com/ajax/seatingPlan?timestamp=${new DateTime.now().millisecondsSinceEpoch}",
          header: {
        'User-Agent':
            "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Mobile Safari/537.36"
      },
          queryParameters: {
        /*'cityId': 1,
        'ci': 1,
        'optimus_uuid':
            "6DAD8D70EFCF11E99BB4958E7854CCC30FD710A1C9C7476CB9250F488C1CC891",
        'optimus_platform': 3,
        'optimus_risk_level': 71,
        'optimus_code': 10,*/
        'seqNo': ctx.state.cinemaMovie.seqNo,
      }))
      .yes((value) {
    ctx.dispatch(MovieSeatActionCreator.onSetSeatData(value));
  });
}

Future<void> _onCommit(Action action, Context<MovieSeatState> ctx) async {
  if (ctx.state.localSelectMovie.isNotEmpty) {
    UserHelper.loginCheck(ctx.context, () async {
      (await RequestClient.request<MovieOrderEntity>(
              ctx.context, HttpConstants.MovieOrderInfo,
              showLoadingIndicator: true,
              header: {
            'User-Agent':
                "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Mobile Safari/537.36"
          },
              queryParameters: {
            'seqNo': ctx.state.cinemaMovie.seqNo,
            'count': ctx.state.localSelectMovie.length,
          }))
          .yes((value) {
        Navigator.pushNamed(ctx.context, PageConstants.MovieOrderPrePage,
            arguments: {
              'cinemaMovie': ctx.state.cinemaMovie,
              'order': value.data,
              'selectCinemaMovie': ctx.state.selectCinemaMovie,
              'seatEntity': ctx.state.seatEntity,
              'localSelectMovie': ctx.state.localSelectMovie,
              'cinemaMovies': ctx.state.cinemaMovies,
            });
//        ctx.dispatch(MovieSeatActionCreator.onSetSeatData(value));
      });
    });
  } else {
    showToast("请选择座位");
  }
}
