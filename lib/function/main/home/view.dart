import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
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
  return NestedScrollView(
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
          title: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: <Widget>[
                  new Icon(
                    Icons.search,
                    size: 30.0,
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
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: viewService.buildComponent("banner"),
          ),
        ),
      ];
    },
    body: EasyRefresh.custom(
      firstRefresh: true,
      controller: state.controller,
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
                  delegate: _SliverAppBarDelegate(
                    viewService.buildComponent("tab"),
                  )),
              SliverToBoxAdapter(
                child: Container(
                  height: 37.0,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 5.0),
                        child: Image.asset(
                          "assets/home_page_icon_gonggao.png",
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 11.0),
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              /*var itemNotice =
                                homeEntity.sysNotices[controller.position ?? 0];
                            NavigatorHelper.pushWebPage(
                              context,
                              itemNotice.title,
                              HttpConstants.NoticeDetail +
                                  itemNotice.noticeId.toString(),
                            );*/
                            },
                            child: Container(
                              height: 34.0,
                              child: Marquee(
                                fontSize: 12.0,
                                textColor: color343434,
                                aligment: MarqueeAligment.left,
                                textList:
                                    state.homeData.sysNotices.map((itemNotice) {
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
                delegate: SliverChildListDelegate(
                    state.homeData.recommendProduct.map((item) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: themeData.dividerColor,
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                      ),
                      color: colorWhite,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://img.alicdn.com/imgextra/i3/678669052/O1CN01hpqOYo2GjrhmAThZA_!!0-item_pic.jpg",
                                fit: BoxFit.fill,
                                width: 120.0,
                                height: 120.0,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 120.0,
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 5.0, left: 10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("德尔的额"),
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "原价 ¥49",
                                              style: themeData.textTheme.caption
                                                  .merge(TextStyle(
                                                      color: colorA4A4A4)),
                                            ),
                                            Text("已售 7.2万件",
                                                style: themeData
                                                    .textTheme.caption
                                                    .merge(TextStyle(
                                                        color: colorA4A4A4))),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text: "券后价 ",
                                                        style: TextStyle(
                                                            fontSize: 12.0,
                                                            color:
                                                                accentColor)),
                                                    TextSpan(
                                                        text: "¥29",
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color:
                                                                accentColor)),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 25.0,
                                                child: OutlineButton(
                                                  disabledBorderColor:
                                                      accentColor,
                                                  child: Text(
                                                    '20元券',
                                                    style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: accentColor),
                                                  ),
                                                  onPressed: null,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList()),
              )
            ],
    ),
  );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Widget _tabBar;

  @override
  double get minExtent => WindowUtils.getScreenWidth() / 4 * 2;

  @override
  double get maxExtent => WindowUtils.getScreenWidth() / 4 * 2;

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
