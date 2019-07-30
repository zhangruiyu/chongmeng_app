import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RecipeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("宠物食谱"),
    ),
    body: EasyRefresh.custom(
        firstRefresh: true,
        firstRefreshWidget: LoadingWidget(),
        onRefresh: CompleterUtils.produceCompleterAction(
          dispatch,
          RecipeActionCreator.onRefresh,
        ),
        slivers: [
          SliverToBoxAdapter(
            child: Text("123"),
          )
        ]),
  );
}
