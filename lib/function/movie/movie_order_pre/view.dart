import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MovieOrderPreState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("订单支付"),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              ExtendedImage.network(
                  state.selectCinemaMovie.img.replaceAll("w.h", "148.208")),
              SizedBox(
                height: 208,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        state.seatEntity.seatData.movie.movieName,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${state.seatEntity.seatData.xShow.showDate} ${state.seatEntity.seatData.xShow.showTime} ${state.seatEntity.seatData.xShow.lang + state.seatEntity.seatData.xShow.dim}",
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        state.seatEntity.seatData.cinema.cinemaName,
                        style: TextStyle(color: color7E7E7E),
                      ),
                      Text(
                        state.seatEntity.seatData.hall.hallName,
                        style: TextStyle(color: color7E7E7E),
                      ),
                      Text("市场价"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        //座位展示
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text("座位"), Text("1拍1做")],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "影院地址:${state.cinemaMovies.cinemaData.addr}",
            textAlign: TextAlign.start,
          ),
        ),
        VerticalLine(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "购票须知",
            textAlign: TextAlign.start,
          ),
        ),
      ],
    ),
  );
}
