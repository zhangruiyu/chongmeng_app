import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    IntegralElemeItemState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  final Widget image = GestureDetector(
    onTap: () {
      dispatch(IntegralElemeItemActionCreator.onSkipElemeDetailPage());
    },
    child: CachedNetworkImage(
      fit: BoxFit.fitWidth,
      imageUrl: state.itemData.pic,
    ),
  );
  return GridTile(
    footer: GestureDetector(
      onTap: () {
        dispatch(IntegralElemeItemActionCreator.onSkipElemeDetailPage());
      },
      child: GridTileBar(
        backgroundColor: Colors.black45,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(state.itemData.title),
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
