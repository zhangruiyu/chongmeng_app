import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/keep_alive_widget.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:chongmeng/widget/refresh_widget.dart';
import 'package:chongmeng/widget/vertical_line.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'index_inherited.dart';
import 'state.dart';

Widget buildView(
    CommunityState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: colorWhite,
    child: Column(
      children: <Widget>[
        Container(
            width: double.infinity,
            color: Theme.of(viewService.context).accentColor,
            child: TabBar(
                controller: state.tabController,
                isScrollable: true,
//          indicator: getIndicator(),
                tabs: state.pageData.values
                    .map((item) => Tab(text: item.name))
                    .toList()),
            padding: EdgeInsets.only(
                top: MediaQuery.of(viewService.context).padding.top,
                bottom: 2.0)),
        Expanded(
          child: TabBarView(
            controller: state.tabController,
            children: state.pageData.values.map<Widget>((page) {
              return KeepAliveWidget(
                child: EasyRefresh.custom(
                  onRefresh: CompleterUtils.produceCompleterAction(
                      dispatch, CommunityActionCreator.onRefresh,
                      params: (Map<String, dynamic> p) {
                    p['filtrateType'] = page.filtrateType;
                  }),
                  onLoad: CompleterUtils.produceCompleterAction(
                      dispatch, CommunityActionCreator.onLoadMore,
                      params: (Map<String, dynamic> p) {
                    p['filtrateType'] = page.filtrateType;
                  }),
                  slivers: <Widget>[
                    viewService.buildComponent(page.filtrateType)
                  ],
                  firstRefreshWidget: LoadingWidget(),
                  firstRefresh: true,
                ),
              );
            }).toList(),
          ),
        )
      ],
    ),
  );
}
