import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/widget/refresh_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommunityState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Container(
    child: Column(
      children: <Widget>[
        Container(
            width: double.infinity,
            color: Theme.of(viewService.context).accentColor,
            child: TabBar(
                controller: state.tabController,
                isScrollable: true,
//          indicator: getIndicator(),
                tabs: state.pageData
                    .map((item) => Tab(text: item.name))
                    .toList()),
            padding: EdgeInsets.only(
                top: MediaQuery.of(viewService.context).padding.top,
                bottom: 2.0)),
        Expanded(
          child: TabBarView(
            controller: state.tabController,
            children: state.pageData.map<Widget>((page) {
              return SafeArea(
                child: EasyRefreshYM(
                  firstRefresh: true,
                  onRefresh: CompleterUtils.produceCompleterAction(
                      dispatch, CommunityActionCreator.onRefresh,
                      params: (Map<String, dynamic> p) {
                    p['filtrateType'] = page.filtrateType;
                  }),
                  loadMore: CompleterUtils.produceCompleterAction(
                      dispatch, CommunityActionCreator.onLoadMore,
                      params: (Map<String, dynamic> p) {
                    p['filtrateType'] = page.filtrateType;
                  }),
                  child: ListView.builder(
                    itemBuilder: adapter.itemBuilder,
                    itemCount: adapter.itemCount,
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    ),
  );
}
