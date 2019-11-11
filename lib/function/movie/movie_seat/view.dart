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
  var seat = state.seatEntity?.seatData?.seat;
  //数字控件大小
  double numberWidth = 20;
  double padding = 8;
  var itemWidth = (WindowUtils.getScreenWidth() - numberWidth - padding * 2) /
      ((seat?.regions?.first?.rows?.first?.seats?.length ?? 0) + 8);

  return Scaffold(
    appBar: Toolbar(),
    body: state.seatEntity == null
        ? Container()
        : Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: WindowUtils.getScreenWidth() * 2 / 3,
                margin: const EdgeInsets.only(
                  bottom: 40.0,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0)),
                    color: Colors.grey[300]),
                child: Text(
                  state.seatEntity.seatData.hall.hallName,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              ...seat.regions.first.rows.map((itemColumn) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        color: Colors.grey[200],
                        alignment: Alignment.center,
                        width: numberWidth,
                        child: Text(itemColumn.rowNum.toString()),
                      ),
                      ...itemColumn.seats.map((itemRow) {
                        if (itemRow.columnId.isEmpty) {
                          return Container(
                            width: itemWidth,
                          );
                        }
//                      return Text((itemRow.seatStatus - 1).toString());
                        SeatSeatdataSeatImageSeatlegend image;
                        if (state.localSelectMovie.contains(itemRow)) {
                          //2是已选,已选是我们自己操作的
                          image = seat.image.seatLegends[2];
                        } else if (itemRow.seatStatus == 1) {
                          //1是未选择
                          image = seat.image.seatLegends[0];
                        }
                        if (itemRow.seatStatus == 3) {
                          //3是已经被别人订了
                          image = seat.image.seatLegends[1];
                        }
                        return GestureDetector(
                          onTap: () {
                            dispatch(
                                MovieSeatActionCreator.onSelectSeat(itemRow));
                          },
                          child: ExtendedImage.network(
                            image.legendIcon,
                            width: itemWidth,
                          ),
                        );
                      }).toList()
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
  );
}
