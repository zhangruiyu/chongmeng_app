import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'state.dart';

Widget buildView(TabState state, Dispatch dispatch, ViewService viewService) {
  return Card(
    margin: const EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        Row(
          children: state.tabData
              .sublist(0, 4)
              .map<Widget>((itemMenu) => buildItem(itemMenu, viewService))
              .toList(),
        ),
        Row(
          children: state.tabData
              .sublist(4, state.tabData.length)
              .map<Widget>((itemMenu) => buildItem(itemMenu, viewService))
              .toList(),
        ),
      ],
    ),
  );
}

buildItem(itemMenu, viewService) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        if (itemMenu.title == "记一笔") {
          UserHelper.loginCheck(viewService.context, () {
            Navigator.pushNamed(viewService.context, PageConstants.TallyPage);
          });
        } else if (itemMenu.title == "签到") {
          UserHelper.loginCheck(viewService.context, () {
            Navigator.pushNamed(viewService.context, PageConstants.SignInPage);
          });
        }
      },
      child: Column(
        children: <Widget>[
          itemMenu.imageUrl.startsWith("http")
              ? CachedNetworkImage(
                  imageUrl: itemMenu.imageUrl,
                )
              : new Image.asset(
                  itemMenu.imageUrl,
                  height: 40.0,
                ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(itemMenu.title),
          )
        ],
      ),
    ),
  );
}
