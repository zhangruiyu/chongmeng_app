import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/refresh_widget.dart';
import 'package:chongmeng/widget/vertical_line.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommunityState state, Dispatch dispatch, ViewService viewService) {
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
              return SafeArea(
                top: false,
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
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return buildContent(page.data[index]);
                      }, childCount: page.data.length),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        )
      ],
    ),
  );
}

Widget buildContent(DynamicListData data) {
  int gridCount = 3;

  double itemWidth = WindowUtils.getScreenWidth() / gridCount.toDouble();

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipOval(
                child: CachedNetworkImage(
              width: 50.0,
              imageUrl: data.avatar,
            )),
            Column(
              children: <Widget>[
                Text(data.nickName),
                Text("新车上路"),
              ],
            ),
          ],
        ),
        Text(data.content),
        data.images?.isEmpty == true
            ? Container(
                child: Stack(
                  children: <Widget>[],
                ),
              )
            : GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.images.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: itemWidth,
                      height: itemWidth,
                      imageUrl:
                          "http://mengchong-1253631018.picbj.myqcloud.com/" +
                              data.images[index],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridCount),
              ),
        VerticalLine()
      ],
    ),
  );
}
