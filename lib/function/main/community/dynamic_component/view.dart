import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/vertical_line.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    DynamicItemState state, Dispatch dispatch, ViewService viewService) {
  int gridCount = 3;
  var paddingLeft = 18.0;
  var itemPaddingLeft = 8.0;
  double itemWidth =
      (WindowUtils.getScreenWidth() - paddingLeft * 2 - itemPaddingLeft * 2) /
          gridCount.toDouble();

  return Container(
    padding: EdgeInsets.only(top: 18.0, left: paddingLeft, right: paddingLeft),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipOval(
                child: CachedNetworkImage(
              width: 40.0,
              imageUrl: state.avatar,
            )),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(state.nickName),
                  Text(
                    "新车上路",
                    style: TextStyle(fontSize: 12.0, color: color7E7E7E),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(state.content),
        ),
        state.images?.isEmpty == true
            ? Container(
                child: Stack(
                  children: <Widget>[],
                ),
              )
            : Row(
                children: state.images
                    .sublist(
                        0, state.images.length > 3 ? 3 : state.images.length)
                    .map((itemImage) {
                  var isCenter = false;
                  if (state.images.length >= 3 &&
                      state.images.indexOf(itemImage) == 1) {
                    isCenter = true;
                  }
                  return Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: isCenter ? itemPaddingLeft : 0.0,
                          right: isCenter ? itemPaddingLeft : 0.0),
                      child: new CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: itemWidth,
                        height: itemWidth,
                        imageUrl:
                            "http://mengchong-1253631018.picbj.myqcloud.com/" +
                                itemImage,
                      ),
                    ),
                  );
                }).toList(),
              ),
        VerticalLine()
      ],
    ),
  );
}
