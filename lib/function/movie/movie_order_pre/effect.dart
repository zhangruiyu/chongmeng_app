import 'dart:convert';

import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'state.dart';

Effect<MovieOrderPreState> buildEffect() {
  return combineEffects(<Object, Effect<MovieOrderPreState>>{
    Lifecycle.initState: _initState,
    MovieOrderPreAction.Commit: _onCommit,
  });
}

void _initState(Action action, Context<MovieOrderPreState> ctx) {}

Future<void> _onCommit(Action action, Context<MovieOrderPreState> ctx) async {
  var state = ctx.state;
//  if (state.order.totalUserIntegral < state.order.totalPay) {
//    showToast("积分不足");
//  } else {
  (await RequestClient.request(ctx.context, HttpConstants.payMovieOrder,
          queryParameters: {
        //序列号
        'seqNo': ctx.state.cinemaMovie.seqNo,

        'count': ctx.state.localSelectMovie.length,
        //电影院位置
        'addr': ctx.state.cinemaMovies.cinemaData.addr,
        //经纬度
        'lng': ctx.state.cinemaMovies.cinemaData.lng,
        'lat': ctx.state.cinemaMovies.cinemaData.lat,
        //电影院名称
        'cinemaName': ctx.state.cinemaMovies.showData.cinemaName,
        //电影名称
        'movieName': state.seatEntity.seatData.movie.movieName,
        //开始播放时间
        'showDate':
            "${ctx.state.seatEntity.seatData.xShow.showDate} ${ctx.state.seatEntity.seatData.xShow.showTime}",
        //2d还是3d
        'dim': ctx.state.seatEntity.seatData.xShow.dim,
        //影片语言
        'lang': ctx.state.seatEntity.seatData.xShow.lang,
        //选择的座位json串
        'SelectMovie': json.encode(state.localSelectMovie.map((itemSeat) => {
              "rowId": itemSeat.rowId,
              "columnId": itemSeat.columnId,
            })),
      }))
      .yes((value) {});
//  }
}
