import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    UserDetailsState state, Dispatch dispatch, ViewService viewService) {
  var user = GlobalStore.store.getState().localUser;
  var of = Theme.of(viewService.context);
  return Scaffold(
    backgroundColor: colorWhite,
    body: Stack(
      children: <Widget>[
        CachedNetworkImage(
          height: 230.0,
          width: WindowUtils.getScreenWidth(),
          fit: BoxFit.cover,
          imageUrl:
              "https://pics7.baidu.com/feed/14ce36d3d539b600ee906ba88895e02ec75cb799.jpeg?token=4cc8bcf04eaa479fcc085524d0fd2976&s=BB936F854663FEE41895BD230300A040",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: ClipOval(
                    child: CachedNetworkImage(
                  width: 60.0,
                  height: 60.0,
                  fit: BoxFit.cover,
                  imageUrl: user.avatar,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 20.0),
                child: Text(
                  user.nickName,
                  style: of.textTheme.subhead,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10.0),
                child: Text(user.description,
                    style: of.textTheme.caption
                        .merge(TextStyle(color: color7E7E7E))),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10.0, top: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[Text("0"), Text("关注")],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[Text("0"), Text("粉丝")],
                      ),
                    ),
                    Expanded(
                      child: InkResponse(
                        onTap: () async {
                          Navigator.pushNamed(viewService.context,
                              PageConstants.IntegralRecordPage);
                        },
                        child: Column(
                          children: <Widget>[Text("100"), Text("萌镚")],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkResponse(
                        onTap: () async {
                          Navigator.pushNamed(
                              viewService.context, PageConstants.MyPetPage);
                        },
                        child: Column(
                          children: <Widget>[Text("1"), Text("宠物")],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Toolbar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                      viewService.context, PageConstants.UserDetailsEditPage);
                },
                icon: Icon(
                  Icons.border_color,
                  size: 17.0,
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
