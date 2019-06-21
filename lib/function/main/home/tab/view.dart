import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(TabState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
    color: colorWhite,
    child: Row(
      children: state.tabData.map((itemMenu) {
        return Flexible(
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  new CachedNetworkImage(
                    imageUrl: itemMenu.picUrl,
                    height: 51.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Text(itemMenu.title),
                  )
                ],
              ),
            ));
      }).toList(),
    ),
  );
}
