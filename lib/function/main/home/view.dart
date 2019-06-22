import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  var primaryColor = Theme.of(viewService.context).primaryColor;
  return Scaffold(
    backgroundColor: Colors.white,
//    appBar: Toolbar(),
    body: state.homeData == null
        ? Container(
            child: Text("没有数据"),
          )
        : NestedScrollView(
//      controller: state.scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
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
                ),
                SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      PreferredSize(
                        child: viewService.buildComponent("tab"),
                        preferredSize: Size(double.infinity, 128.0),
                      ),
                    ))
              ];
            },
//      body: viewService.buildComponent("product"),
            body: ListView(
              children: List.generate(1000, (int index) {
                return "text $index";
              }).map((text) {
                return ListTile(
                  title: Text(text),
                  subtitle: Text("subtitle" + text),
                  trailing: RaisedButton(
                    child: Text("查看详情"),
                    onPressed: () {},
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
