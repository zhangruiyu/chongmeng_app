import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/keep_alive_widget.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../routes.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    UserDetailsState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    backgroundColor: colorWhite,
    body: EasyRefresh.custom(
      firstRefresh: true,
      firstRefreshWidget: LoadingWidget(),
      onRefresh: CompleterUtils.produceCompleterAction(
        dispatch,
        UserDetailsActionCreator.onRefresh,
      ),
      slivers: state.data == null
          ? <Widget>[]
          : <Widget>[
              SliverAppBar(
                pinned: true,
                forceElevated: true,
                floating: true,
                elevation: 0.0,
                brightness: Brightness.light,
                leading: BackButton(
                  color: colorBack,
                ),
                backgroundColor: Colors.transparent,
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () {
                        dispatch(UserDetailsActionCreator.onSkipEditUserPage());
                      },
                      icon: Icon(
                        Icons.border_color,
                        size: 17.0,
                      ),
                    ),
                  )
                ],
                expandedHeight: 235,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Stack(
                    children: <Widget>[
                      CachedNetworkImage(
                        height: 230.0,
                        width: WindowUtils.getScreenWidth(),
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://pics7.baidu.com/feed/14ce36d3d539b600ee906ba88895e02ec75cb799.jpeg?token=4cc8bcf04eaa479fcc085524d0fd2976&s=BB936F854663FEE41895BD230300A040",
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(60.0),
                              ),
                              border: Border.all(
                                color: colorWhite,
                                width: 1.0,
                              ),
                            ),
                            child: ClipOval(
                                child: CachedNetworkImage(
                              width: 60.0,
                              height: 60.0,
                              fit: BoxFit.cover,
                              imageUrl: state.data.avatar,
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 20.0),
                      child: Text(
                        state.data.nickName,
                        style: of.textTheme.subhead,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 10.0),
                      child: Text(state.data.description,
                          style: of.textTheme.caption
                              .merge(TextStyle(color: color7E7E7E))),
                    ),
                    buildCenter(state, viewService),
                  ],
                ),
              ),
              SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: _SliverAppBarDelegate(Container(
                      width: double.infinity,
                      child: TabBar(
                          controller: state.tabController,
                          indicator: BoxDecoration(
                            color: Theme.of(viewService.context).accentColor,
                          ),
                          tabs: state.pageData.values
                              .map((item) => Tab(text: item.name))
                              .toList()),
                      padding: EdgeInsets.only(bottom: 2.0)))),
              SliverFillRemaining(
                child: TabBarView(
                  controller: state.tabController,
                  children: state.pageData.values.map<Widget>((page) {
                    return KeepAliveWidget(
                      child: Text("131312"),
                    );
                  }).toList(),
                ),
              )
            ],
    ),
  );
}

Container buildCenter(UserDetailsState state, ViewService viewService) {
  return Container(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Text(state.data?.subscribersCount?.toString() ?? "*"),
              Text("关注")
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(state.data?.fans?.toString() ?? "*"),
              Text("粉丝")
            ],
          ),
        ),
        Expanded(
          child: InkResponse(
            onTap: () async {
              Navigator.pushNamed(
                  viewService.context, PageConstants.IntegralRecordPage);
            },
            child: Column(
              children: <Widget>[
                Text(state.data?.totalIntegral?.toString() ?? "*"),
                Text("萌镚")
              ],
            ),
          ),
        ),
        Expanded(
          child: InkResponse(
            onTap: () async {
              Navigator.pushNamed(viewService.context, PageConstants.MyPetPage);
            },
            child: Column(
              children: <Widget>[
                Text(state.data?.petCount?.toString() ?? "*"),
                Text("宠物")
              ],
            ),
          ),
        )
      ],
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
