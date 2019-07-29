import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/function/main/home/action.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_vertical_marquee/flutter_vertical_marquee.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  var themeData = Theme.of(viewService.context);
  var accentColor = themeData.accentColor;
  var buildAdapter = viewService.buildAdapter();
  return Scaffold(
    backgroundColor: colorWhite,
    body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: accentColor,
            pinned: true,
            elevation: 0.0,
            floating: true,
            leading: null,
            automaticallyImplyLeading: false,
            expandedHeight: 197,
            primary: true,
            title: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    viewService.context, PageConstants.SearchPage);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: <Widget>[
                      new Icon(
                        Icons.search,
                        size: 25.0,
                        color: accentColor,
                      ),
                      Text(
                        "寻觅快乐",
                        style: TextStyle(fontSize: 14.0, color: accentColor),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color(0x96ffffff),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: viewService.buildComponent("banner"),
            ),
          ),
        ];
      },
      body: EasyRefresh.custom(
        controller: state.controller,
        firstRefresh: true,
        firstRefreshWidget: LoadingWidget(),
        onRefresh: CompleterUtils.produceCompleterAction(
          dispatch,
          HomeActionCreator.onRefresh,
        ),
        slivers: state.homeData == null
            ? [
                SliverList(
                  delegate: SliverChildListDelegate([]),
                )
              ]
            : [
                SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: _SliverAppBarDelegate(Card(
                      margin: const EdgeInsets.all(8.0),
                      child: viewService.buildComponent("tab"),
                    ))),
                SliverToBoxAdapter(
                  child: Container(
                    height: 37.0,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 5.0),
                          child: Image.asset(
                            "assets/home_page_icon_gonggao.png",
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 11.0),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {},
                              child: Container(
                                height: 34.0,
                                child: Marquee(
                                  fontSize: 12.0,
                                  textColor: color343434,
                                  aligment: MarqueeAligment.left,
                                  textList: state.homeData.sysNotices
                                      .map((itemNotice) {
                                    return itemNotice;
                                  }).toList(),
                                  controller: MarqueeController(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(buildAdapter.itemBuilder,
                      childCount: buildAdapter.itemCount),
                )
              ],
      ),
    ),
  );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Widget _tabBar;

  @override
  double get minExtent => 180.0;

  @override
  double get maxExtent => 180.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: new BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFfafafa), Color(0xFFfcfcfc), Color(0xFFffffff)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
