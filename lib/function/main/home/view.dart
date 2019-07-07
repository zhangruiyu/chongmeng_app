import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      leading: null,
    ),
    backgroundColor: Colors.white,
    body: state.homeData == null
        ? Container(
            child: Text("没有数据"),
          )
        : NestedScrollView(
//      controller: state.scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                /* SliverAppBar(
//            backgroundColor: colorWhite,
                  pinned: false,
                  floating: true,
                  leading: null,
                  automaticallyImplyLeading: false,
                  expandedHeight: 197,
                  primary: false,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: viewService.buildComponent("banner"),
                  ),
                ),*/
                SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      PreferredSize(
                        child: viewService.buildComponent("tab"),
                        preferredSize: Size(double.infinity, 96.0),
                      ),
                    ))
              ];
            },
            body: ListView(
              children: state.homeData.content.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    onTap: () {
                      NavigatorHelper.pushWebPage(
                          viewService.context, item.title, item.url);
                    },
                    title: Text(item.title),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: item.picUrl,
                        fit: BoxFit.fill,
                        width: 60.0,
                        height: 60.0,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
  );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._content);

  final PreferredSize _content;

  @override
  double get minExtent => _content.preferredSize.height;

  @override
  double get maxExtent => _content.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: new BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFfafafa), Color(0xFFfcfcfc), Color(0xFFffffff)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: _content,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
