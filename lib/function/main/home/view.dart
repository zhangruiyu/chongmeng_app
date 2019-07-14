import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  var accentColor = Theme.of(viewService.context).accentColor;
  return Scaffold(
    backgroundColor: Colors.white,
    body: state.homeData == null
        ? Container(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 100.0,
                      color: accentColor,
                    ),
                  ],
                )
              ],
            ),
          )
        : EasyRefresh.custom(
            slivers: <Widget>[
              SliverAppBar(
                title: Text(
                  "宠萌",
                  style: TextStyle(color: colorWhite),
                ),
                actions: <Widget>[
                  new IconButton(
                      icon: new Icon(
                        Icons.search,
                        size: 30.0,
                        color: colorWhite,
                      ),
                      onPressed: () {})
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 40.0,
                        color: accentColor,
                      ),
                      viewService.buildComponent("banner"),
                    ],
                  ),
                  viewService.buildComponent("tab"),
                ]),
              ),
              SliverList(
                delegate:
                    SliverChildListDelegate(state.homeData.content.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      onTap: () {
                        NavigatorHelper.pushWebPage(
                            viewService.context, item.title, item.url);
                      },
                      title: Text(item.title),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: item.picUrl,
                          fit: BoxFit.fill,
                          width: 60.0,
                          height: 60.0,
                        ),
                      ),
                    ),
                  );
                }).toList()),
              ),
            ],
          ),
  );
}
