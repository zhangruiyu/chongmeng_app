import 'package:chongmeng/utils/completer_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ItemBodyState state, Dispatch dispatch, ViewService viewService) {
  var buildAdapter = viewService.buildAdapter();
  return SliverList(
    delegate: SliverChildBuilderDelegate(buildAdapter.itemBuilder,
        childCount: buildAdapter.itemCount),
  );
}
