import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/function/main/store/integral_component/view.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(IntegralCommodityDetailState state, Dispatch dispatch,
    ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("商品详情"),
    ),
    body: Column(
      children: <Widget>[
        Hero(
          tag: "0",
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl,
          ),
        )
      ],
    ),
  );
}
