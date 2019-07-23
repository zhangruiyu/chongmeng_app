import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/vertical_line.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
  var data = state.data;
  List<Widget> content;
  if (data.images != null && data.images.length > 0) {
    if (data.images.length >= 3) {
      content = buildThreePicView(state, dispatch, viewService);
    } else if (data.images.length == 1) {
      content = buildOnePicView(state, dispatch, viewService);
    } else if (data.images.length == 2) {
      content = buildTwoPicView(state, dispatch, viewService);
    } else {
      content = [Container()];
    }
  } else if (data.video != null) {
    content = buildVideoView(state, dispatch, viewService);
  } else {
    content = [
      Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Text(data.content, maxLines: 5, overflow: TextOverflow.ellipsis),
      )
    ];
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
              imageUrl: data.avatar,
            )),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(data.nickName),
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
        buildFunCell(state, dispatch, viewService),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: VerticalLine(),
        )
      ],
    ),
  );
}

Widget buildFunCell(
    DynamicItemState state, Dispatch dispatch, ViewService viewService) {
  var data = state.data;
  var accentColor = Theme.of(viewService.context).accentColor;
  var primaryColor = Theme.of(viewService.context).primaryColor;
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        /* IconButton(
          onPressed: () {},
          icon: Icon(
            MdiIcons.messageOutline,
            color: Colors.grey,
          ),
        ),*/
        LikeButton(
          onTap: (isLiked) {
            final Completer<bool> completer = new Completer<bool>();
            Map<String, dynamic> paramsMap = {
              "isLiked": isLiked,
              "completer": (bool liked) {
                completer.complete(liked);
              },
            };
            dispatch(DynamicItemActionCreator.onRequestSetLiked(paramsMap));
            return completer.future;
          },
          circleColor: CircleColor(start: accentColor, end: primaryColor),
          bubblesColor: BubblesColor(
            dotPrimaryColor: accentColor,
            dotSecondaryColor: primaryColor,
          ),
          isLiked: data.liked
              .contains(GlobalStore.store.getState().localUser.userId),
          likeBuilder: (bool isLiked) {
            return Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? accentColor : Colors.grey,
            );
          },
          likeCount: data.liked.length,
          countBuilder: (int count, bool isLiked, String text) {
            var color = isLiked ? accentColor : Colors.grey;
            Widget result;
            if (count == 0) {
              result = Text(
                "0",
                style: TextStyle(color: color),
              );
            } else
              result = Text(
                text,
                style: TextStyle(color: color),
              );
            return result;
          },
        ),
      ],
    ),
  );
}

List<Widget> buildOnePicView(
    DynamicItemState state, Dispatch dispatch, ViewService viewService) {
  var data = state.data;
  var itemImage = data.images[0];
  return [
    Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Text(data.content,
                maxLines: 5, overflow: TextOverflow.ellipsis),
            flex: 2,
            fit: FlexFit.tight,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                  left: itemPaddingLeft, right: itemPaddingLeft),
              child: GestureDetector(
                onTap: () {
                  dispatch(DynamicItemActionCreator.onSkipReviewPage(0));
                },
                child: new CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: itemWidth * 1.2,
                  height: itemWidth,
                  imageUrl: "http://mengchong-1253631018.picbj.myqcloud.com/" +
                      itemImage,
                ),
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
  var data = state.data;
  return [
    Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Text(data.content),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data.images
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
                        child: GestureDetector(
                          onTap: () {
                            dispatch(DynamicItemActionCreator.onSkipReviewPage(
                                index));
                          },
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
                    ),
                  ));
            })
            .values
            .toList(),
      ),
    )
  ];
}

List<Widget> buildThreePicView(
    DynamicItemState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  var data = state.data;
  int gridCount = 3;
  var paddingLeft = 18.0;
  var itemPaddingLeft = 8.0;
  double itemWidth =
      (WindowUtils.getScreenWidth() - paddingLeft * 2 - itemPaddingLeft * 2) /
          gridCount.toDouble();
  return [
    Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Text(data.content),
    ),
    SizedBox(
      height: itemWidth,
      child: Stack(
        children: <Widget>[
          Row(
            children: data.images
                .sublist(0, 3)
                .asMap()
                .map((index, itemImage) {
                  var isCenter = false;
                  if (data.images.length >= 3 &&
                      data.images.indexOf(itemImage) == 1) {
                    isCenter = true;
                  }
                  return MapEntry(
                      index,
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: isCenter ? itemPaddingLeft : 0.0,
                              right: isCenter ? itemPaddingLeft : 0.0),
                          child: GestureDetector(
                            onTap: () {
                              dispatch(
                                  DynamicItemActionCreator.onSkipReviewPage(
                                      index));
                            },
                            child: new CachedNetworkImage(
                              fit: BoxFit.cover,
                              width: itemWidth,
                              height: itemWidth,
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
          data.images.length == 3
              ? Container()
              : Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: new BorderRadius.only(
                            topLeft: Radius.circular(10.0))),
                    padding: EdgeInsets.only(right: 5.0, left: 8.0),
                    child: Text(
                      (data.images.length - 3).toString(),
                      style: of.textTheme.caption
                          .merge(TextStyle(color: colorWhite)),
                    ),
                  ),
                )
        ],
      ),
    )
  ];
}

List<Widget> buildVideoView(
    DynamicItemState state, Dispatch dispatch, ViewService viewService) {
  var data = state.data;
  var video = data.video;
  return [
    Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Text(data.content),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          new CachedNetworkImage(
            fit: BoxFit.cover,
            height: WindowUtils.getScreenWidth() * 0.45,
            width: double.infinity,
            imageUrl: "http://mengchong-1253631018.picbj.myqcloud.com/" +
                video.videoThumbnailPath,
          ),
          IconButton(
            onPressed: () {
              dispatch(DynamicItemActionCreator.onSkipReviewPage(0));
            },
            icon: Icon(Icons.play_circle_outline),
            color: Theme.of(viewService.context).accentColor,
            iconSize: 50.0,
          )
        ],
      ),
    )
  ];
}
