import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(TabState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: colorWhite,
    child: Row(
      children: state.tabData.map((itemMenu) {
        return Flexible(
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: () {
                if (itemMenu.title == "记一笔") {
                  UserHelper.loginCheck(viewService.context, () {
                    Navigator.pushNamed(
                        viewService.context, PageConstants.TallyPage);
                  });
                }
              },
              child: Column(
                children: <Widget>[
                  new Image.asset(
                    itemMenu.picUrl,
                    height: 40.0,
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
