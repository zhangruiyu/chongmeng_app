import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'model/seat_entity.dart';
import 'state.dart';

Widget buildView(
    MovieSeatState state, Dispatch dispatch, ViewService viewService) {
  var itemWidth = WindowUtils.getScreenWidth() / 32;
  var seat = state.seatEntity.seatData.seat;
  return Scaffold(
    appBar: Toolbar(),
    body: state.seatEntity == null
        ? Container()
        : Column(
            children: <Widget>[
              Text(state.seatEntity.seatData.hall.hallName),
              ...seat.regions.first.rows.map((itemColumn) {
                return Row(
                  children: [
                    Text(itemColumn.rowNum.toString()),
                    ...itemColumn.seats.map((itemRow) {
                      if (itemRow.columnId.isEmpty) {
                        return Container(
                          width: itemWidth,
                        );
                      }
//                      return Text((itemRow.seatStatus - 1).toString());
                      SeatSeatdataSeatImageSeatlegend image;
                      if (itemRow.seatStatus == 1) {
                        //1是未选择
                        image = seat.image.seatLegends[0];
                      } else if (itemRow.seatStatus == 2) {
                        //2是已选,已选是我们自己操作的
                        image = seat.image.seatLegends[0];
                      } else if (itemRow.seatStatus == 3) {
                        //3是已经被别人订了
                        image = seat.image.seatLegends[1];
                      }
                      return ExtendedImage.network(
                        image.legendIcon,
                        width: itemWidth,
                      );
                    }).toList()
                  ],
                );
              }).toList(),
            ],
          ),
  );
}
