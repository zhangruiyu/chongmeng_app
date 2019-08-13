import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommunityUserHeadState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
    padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
    child: Row(
      children: <Widget>[
        ClipOval(
            child: CachedNetworkImage(
          width: 40.0,
          imageUrl: state.data.avatar,
        )),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(state.data.nickName),
              Text(
                "新车上路",
                style: TextStyle(fontSize: 12.0, color: color7E7E7E),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
