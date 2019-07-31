import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'state.dart';

Widget buildView(TabState state, Dispatch dispatch, ViewService viewService) {
  return Column(
    children: <Widget>[
      SizedBox(
        height: 80.0,
        child: Row(
          children: state.tabData
              .sublist(0, 4)
              .map<Widget>(
                  (itemMenu) => buildItem(state, itemMenu, viewService))
              .toList(),
        ),
      ),
      if (state.tabData.length > 4)
        SizedBox(
          height: 80.0,
          child: Row(
            children: state.tabData
                .sublist(4, state.tabData.length)
                .map<Widget>(
                    (itemMenu) => buildItem(state, itemMenu, viewService))
                .toList(),
          ),
        ),
    ],
  );
}

buildItem(TabState state, HomeDataTab itemMenu, viewService) {
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
        } else if (itemMenu.title == "猫猫" || itemMenu.title == "狗狗") {
          Navigator.pushNamed(viewService.context, PageConstants.SearchPage,
              arguments: {'initChip': itemMenu.chips});
        } else if (itemMenu.title == "食谱") {
          Navigator.pushNamed(viewService.context, PageConstants.RecipePage,
              arguments: {'recipe': state.recipe});
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          itemMenu.imageUrl.startsWith("http")
              ? CachedNetworkImage(
                  imageUrl: itemMenu.imageUrl,
                )
              : new Image.asset(
                  itemMenu.imageUrl,
                  height: 40.0,
                  width: 40.0,
                  fit: BoxFit.contain,
                ),
          Text(itemMenu.title)
        ],
      ),
    ),
  );
}
