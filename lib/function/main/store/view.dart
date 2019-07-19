import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'state.dart';

Widget buildView(StoreState state, Dispatch dispatch, ViewService viewService) {
  var buildAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: Toolbar(
      title: Text("积分"),
      leading: null,
    ),
    body: EasyRefresh.custom(
      slivers: <Widget>[
        SliverGrid(
          delegate: SliverChildBuilderDelegate(buildAdapter.itemBuilder,
              childCount: buildAdapter.itemCount),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 4.0, crossAxisSpacing: 4.0),
        )
      ],
    ),
  );
}
