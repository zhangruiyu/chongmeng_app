import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/hex_color.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:chongmeng/widget/vertical_line.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MovieDetailsState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
      body: state.detailMovie == null
          ? Container()
          : DefaultTabController(
              length: 3,
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  // These are the slivers that show up in the "outer" scroll view.
                  return <Widget>[
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      child: SliverAppBar(
                        leading: new IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: colorWhite,
                          ),
                          onPressed: () {
                            Navigator.pop(viewService.context);
                          },
                        ),
                        title: innerBoxIsScrolled
                            ? Text(
                                state.itemMovie.nm,
                                style: TextStyle(color: colorWhite),
                              )
                            : null,
                        centerTitle: false,
                        pinned: true,
                        floating: false,
                        snap: false,
                        primary: true,
                        expandedHeight:
                            232 + MediaQueryData.fromWindow(window).padding.top,
                        elevation: 1,
                        //是否显示阴影，直接取值innerBoxIsScrolled，展开不显示阴影，合并后会显示
                        forceElevated: innerBoxIsScrolled,
                        actions: <Widget>[
                          new IconButton(
                            icon: Icon(Icons.more_horiz),
                            onPressed: () {
                              print("更多");
                            },
                          ),
                        ],

                        flexibleSpace: new FlexibleSpaceBar(
                          background: Container(
                            height: 232,
                            padding: EdgeInsets.only(
                                top: MediaQueryData.fromWindow(window)
                                    .padding
                                    .top),
                            decoration: BoxDecoration(
                                color: HexColor(
                                    state.detailMovie.backgroundColor)),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0,
                                      top: 12.0,
                                      bottom: 12.0,
                                      right: 12.0),
                                  child: ExtendedImage.network(
                                    state.detailMovie.img
                                        .replaceAll("w.h", "148.208"),
                                    width: 148,
                                    height: 208,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      state.detailMovie.nm,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: colorWhite,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      state.detailMovie.enm,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: colorWhite,
                                      ),
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: state.detailMovie.sc.toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: of.accentColor,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                        text:
                                            "  (${state.detailMovie.snum.toString()}人评)",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: colorWhite,
                                        ),
                                      ),
                                    ])),
                                    Text(
                                      state.detailMovie.cat.toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: colorWhite,
                                      ),
                                    ),
                                    Text(
                                      state.detailMovie.pubDesc.toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: colorWhite,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: StickyTabBarDelegate(
                        child: TabBar(
                          labelColor: Colors.black,
                          controller: state.tabController,
                          tabs: <Widget>[
                            Tab(text: 'Home'),
                            Tab(text: 'Profile'),
                            Tab(text: 'Profile'),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  // These are the contents of the tab views, below the tabs.
                  children: ["12", "12", "1"].map((String name) {
                    //SafeArea 适配刘海屏的一个widget
                    return SafeArea(
                      top: false,
                      bottom: false,
                      child: Builder(
                        builder: (BuildContext context) {
                          return CustomScrollView(
                            key: PageStorageKey<String>(name),
                            slivers: <Widget>[
                              SliverOverlapInjector(
                                handle: NestedScrollView
                                    .sliverOverlapAbsorberHandleFor(context),
                              ),

                              /* TabBar(
                                tabs: ["12", "12", "1"]
                                    .map((String name) => Tab(text: name))
                                    .toList(),
                              ),*/
                              SliverPadding(
                                padding: const EdgeInsets.all(10.0),
                                sliver: SliverFixedExtentList(
                                  itemExtent: 50.0, //item高度或宽度，取决于滑动方向
                                  delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      return ListTile(
                                        title: Text('Item $index'),
                                      );
                                    },
                                    childCount: 30,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            )

      /*  SliverAppBar(
              expandedHeight: 232,
              floating: false,
              pinned: false,
              bottom: TabBar(
                controller: state.tabController,
                tabs: ["12", "12", "1"]
                    .map((String name) => Tab(text: name))
                    .toList(),
              ),
              flexibleSpace: Container(
                height: 232,
                decoration: BoxDecoration(
                    color: HexColor(state.detailMovie.backgroundColor)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, top: 12.0, bottom: 12.0, right: 12.0),
                      child: ExtendedImage.network(
                        state.detailMovie.img.replaceAll("w.h", "148.208"),
                        width: 148,
                        height: 208,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          state.detailMovie.nm,
                          style: TextStyle(
                              fontSize: 18,
                              color: colorWhite,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          state.detailMovie.enm,
                          style: TextStyle(
                            fontSize: 12,
                            color: colorWhite,
                          ),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: state.detailMovie.sc.toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: of.accentColor,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: "  (${state.detailMovie.snum.toString()}人评)",
                            style: TextStyle(
                              fontSize: 12,
                              color: colorWhite,
                            ),
                          ),
                        ])),
                        Text(
                          state.detailMovie.cat.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: colorWhite,
                          ),
                        ),
                        Text(
                          state.detailMovie.pubDesc.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: colorWhite,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          //选择电影院
          SliverFillRemaining(
            child: TabBarView(
                controller: state.tabController,
                children: [1, 2, 3].map((itemData) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(top: 10.0),
                    itemBuilder: (BuildContext context, int index) {
                      var data = 1;
                      return Card(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Text("123"),
                      );
                    },
                    itemCount: 300,
                    separatorBuilder: (BuildContext context, int index) {
                      return VerticalLine(
                        height: 10.0,
                        dividerColor: Colors.transparent,
                      );
                    },
                  );
                }).toList()),
          )*/
      );
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
