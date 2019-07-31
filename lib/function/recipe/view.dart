import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'model/recipe_entity.dart';
import 'state.dart';

Widget buildView(
    RecipeState state, Dispatch dispatch, ViewService viewService) {
//  var indicatorWidth = (WindowUtils.getScreenWidth() / 3 - 14) / 2;
  var indicatorWidth = 15.0;
  var accentColor = Theme.of(viewService.context).accentColor;
  return Scaffold(
    appBar: Toolbar(
        title: Text("宠物食谱"),
        bottom: state.data.length == 0
            ? null
            : TabBar(
                isScrollable: true,
                labelColor: colorWhite,
                indicatorColor: accentColor,
                unselectedLabelColor: colord9d9d9,
                labelStyle: new TextStyle(fontSize: 18.0),
                unselectedLabelStyle: new TextStyle(fontSize: 15.0),
                indicatorPadding: new EdgeInsets.only(
                    left: indicatorWidth, right: indicatorWidth, bottom: 5.0),
                tabs: state.data
                    .map(
                      (RecipeData page) => new Tab(text: page.title),
                    )
                    .toList(),
                controller: state.tabController,
              )),
    body: EasyRefresh.custom(
      firstRefresh: true,
      firstRefreshWidget: LoadingWidget(),
      onRefresh: CompleterUtils.produceCompleterAction(
        dispatch,
        RecipeActionCreator.onRefresh,
      ),
      slivers: <Widget>[
        SliverFillRemaining(
          child: TabBarView(
              controller: state.tabController,
              children: state.data.map((itemData) {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    var data = itemData.data[index];
                    return Text(data.name);
                  },
                  itemCount: itemData.data?.length ?? 0,
                );
              }).toList()),
        )
      ],
    ),
  );
}
