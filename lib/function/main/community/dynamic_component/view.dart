import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/vertical_line.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

int gridCount = 3;
var paddingLeft = 18.0;
var itemPaddingLeft = 8.0;
double itemWidth =
    (WindowUtils.getScreenWidth() - paddingLeft * 2 - itemPaddingLeft * 2) /
        gridCount.toDouble();

Widget buildView(
    DynamicItemState state, Dispatch dispatch, ViewService viewService) {
  List<Widget> content;
  if (state.images != null && state.images.length > 0) {
    if (state.images.length >= 3) {
      content = buildThreePicView(state, dispatch, viewService);
    } else if (state.images.length == 1) {
      content = buildOnePicView(state, dispatch, viewService);
    } else if (state.images.length == 2) {
      content = buildTwoPicView(state, dispatch, viewService);
    } else {
      content = [Container()];
    }
  } else {
    content = [Container()];
  }
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
        ...content,
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: VerticalLine(),
        )
      ],
    ),
  );
}

List<Widget> buildThreePicView(
    DynamicItemState state, Dispatch dispatch, ViewService viewService) {
  int gridCount = 3;
  var paddingLeft = 18.0;
  var itemPaddingLeft = 8.0;
  double itemWidth =
      (WindowUtils.getScreenWidth() - paddingLeft * 2 - itemPaddingLeft * 2) /
          gridCount.toDouble();
  return [
    Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Text(state.content),
    ),
    Row(
      children: state.images.sublist(0, 3).map((itemImage) {
        var isCenter = false;
        if (state.images.length >= 3 && state.images.indexOf(itemImage) == 1) {
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
                  "http://mengchong-1253631018.picbj.myqcloud.com/" + itemImage,
            ),
          ),
        );
      }).toList(),
    )
  ];
}

List<Widget> buildOnePicView(
    DynamicItemState state, Dispatch dispatch, ViewService viewService) {
  var itemImage = state.images[0];
  return [
    Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Text(state.content,
                maxLines: 5, overflow: TextOverflow.ellipsis),
            flex: 2,
            fit: FlexFit.tight,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                  left: itemPaddingLeft, right: itemPaddingLeft),
              child: new CachedNetworkImage(
                fit: BoxFit.cover,
                width: itemWidth * 1.2,
                height: itemWidth,
                imageUrl: "http://mengchong-1253631018.picbj.myqcloud.com/" +
                    itemImage,
              ),
            ),
          ),
        ],
      ),
    )
  ];
}

List<Widget> buildTwoPicView(
    DynamicItemState state, Dispatch dispatch, ViewService viewService) {
  return [
    Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Text(state.content),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: state.images
            .asMap()
            .map((index, itemImage) {
              return MapEntry(
                  index,
                  Flexible(
                    flex: index == 0 ? 2 : 1,
                    fit: FlexFit.tight,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: index == 0 ? itemPaddingLeft : 0),
                        child: new CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: itemWidth,
                          width: double.infinity,
                          imageUrl:
                              "http://mengchong-1253631018.picbj.myqcloud.com/" +
                                  itemImage,
                        ),
                      ),
                    ),
                  ));
            })
            .values
            .toList(),
      ),
    )
  ];
}
