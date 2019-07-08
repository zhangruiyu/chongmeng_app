import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/utils/color_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(TallyState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("记一笔"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              dispatch(TallyActionCreator.onSkipAddTallyPage());
            },
            child: Container(
              alignment: Alignment.center,
              child: Text("添加"),
            ),
          ),
        )
      ],
    ),
    body: CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CachedNetworkImage(
                        width: 60.0,
                        height: 60.0,
                        imageUrl:
                            "http://mengchong-1253631018.picbj.myqcloud.com/",
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Chip(
                              label: Text("标签"),
                              backgroundColor:
                                  ColorUtils.randomColor(index.toString()),
                            ),
                            Text("备注"),
                          ],
                        ),
                      ),
                      Text("价格"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("预计时间"),
                      Text("创建时间"),
                    ],
                  ),
                ],
              ),
            );
          }, childCount: 20),
        ),
      ],
    ),
  );
}
