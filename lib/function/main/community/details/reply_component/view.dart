import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/date_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ReplyState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: CachedNetworkImage(
                imageUrl:
                    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=809666007,4133731274&fm=26&gp=0.jpg",
                fit: BoxFit.cover,
                width: 35.0,
                height: 35.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text("昵称"),
            ),
            Text("昵称"),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 48.0, top: 12.0),
          child: Text("内容可爱呢"),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 48.0, top: 5.0),
          child: CachedNetworkImage(
            imageUrl:
                "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=809666007,4133731274&fm=26&gp=0.jpg",
            fit: BoxFit.cover,
            height: 80.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 48.0, top: 5.0),
          child: Text(
            RelativeDateUtils.getTimestampString(DateTime.now()),
            style: TextStyle(fontSize: 12.0, color: color7E7E7E),
          ),
        ),
      ],
    ),
  );
}
