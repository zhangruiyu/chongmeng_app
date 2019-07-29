import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    IntegralItemState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  final Widget image = GestureDetector(
    onTap: () {
      dispatch(IntegralItemActionCreator.onSkipIntegralCommodityDetailPage());
    },
    child: Hero(
      transitionOnUserGestures: true,
      key: Key(state.index.toString()),
      tag: state.index.toString(),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: state.itemData.pic[0],
      ),
    ),
  );
  return GridTile(
    footer: GestureDetector(
      onTap: () {
        dispatch(IntegralItemActionCreator.onSkipIntegralCommodityDetailPage());
      },
      child: GridTileBar(
        backgroundColor: Colors.black45,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(state.itemData.name),
            Text(
              state.itemData.integralPrice.toString(),
              style:
                  of.textTheme.caption.merge(TextStyle(color: of.accentColor)),
            ),
          ],
        ),
      ),
    ),
    child: image,
  );
}
