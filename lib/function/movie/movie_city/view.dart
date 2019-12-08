import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MovieCityState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("选择城市"),
    ),
    body: EasyRefresh.custom(
        firstRefresh: true,
        firstRefreshWidget: LoadingWidget(),
        onRefresh: CompleterUtils.produceCompleterAction(
          dispatch,
          MovieCityActionCreator.onRefresh,
        ),
        slivers: [
//          SliverList(delegate: null,)
        ]),
  );
}
