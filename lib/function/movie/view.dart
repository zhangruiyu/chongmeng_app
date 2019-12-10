import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'model/hot_movie_entity.dart';
import 'movie_details/view.dart';
import 'state.dart';

Widget buildView(MovieState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  var infoTextStyle = TextStyle(color: color7E7E7E);
  return Scaffold(
    appBar: Toolbar(
      title: Text("电影大厅"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              dispatch(MovieActionCreator.onSelectCity());
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "定位失败",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ),
    floatingActionButton: FloatingActionButton(
      elevation: 0.0,
      onPressed: () {
        dispatch(MovieActionCreator.onShare());
      },
      child: Text(
        "赚",
        style: TextStyle(color: colorWhite, fontSize: 20),
      ),
      backgroundColor: Colors.red,
    ),
    body: EasyRefresh.custom(
        firstRefresh: true,
        firstRefreshWidget: LoadingWidget(),
        onRefresh: CompleterUtils.produceCompleterAction(
          dispatch,
          MovieActionCreator.onRefresh,
        ),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: StickyTabBarDelegate(
              child: TabBar(
                controller: state.tabController,
                labelStyle: TextStyle(),
                labelColor: of.accentColor,
                unselectedLabelColor: colorBack,
                indicatorColor: of.accentColor,
                tabs: state.pageData.values
                    .map((itemTab) => Tab(
                          text: itemTab.name,
                        ))
                    .toList(),
              ),
            ),
          ),
          if (state.data != null)
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                HotMovieDataMovielist itemMovie = state.data.movieList[index];
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          viewService.context, PageConstants.MovieDetailsPage,
                          arguments: {"movie": itemMovie});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          ExtendedImage.network(
                            itemMovie.img.replaceFirst("w.h", "592.832"),
                            width: 80,
                            enableLoadState: false,
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        itemMovie.nm,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      if (itemMovie.version != null &&
                                          itemMovie.version.isNotEmpty)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          margin:
                                              const EdgeInsets.only(left: 14.0),
                                          child: Text(
                                            itemMovie.version,
                                            style: TextStyle(
                                                color: colorWhite,
                                                fontSize: 10),
                                          ),
                                          decoration: BoxDecoration(
                                            color: of.accentColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5.0),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            if (itemMovie.preShow)
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                child: Text(
                                                  "点映",
                                                  style: TextStyle(
                                                      color: colorWhite,
                                                      fontSize: 10),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: of.accentColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(5.0),
                                                  ),
                                                ),
                                              ),
                                            if (itemMovie.sc > 0)
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    "观众评 ",
                                                    style: infoTextStyle,
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 4.0),
                                                    child: Text(
                                                      itemMovie.sc.toString(),
                                                      style: TextStyle(
                                                          color: colorWhite,
                                                          fontSize: 10),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: of.accentColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(5.0),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            Text(
                                              "主演: ${itemMovie.star}",
                                              maxLines: 1,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: infoTextStyle,
                                            ),
                                            Text(
                                              "${itemMovie.showInfo}",
                                              style: infoTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    //购买按钮
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 3.0, horizontal: 8.0),
                                      decoration: BoxDecoration(
                                        color: itemMovie.preShow
                                            ? color448dfe
                                            : Colors.red[400],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5.0),
                                        ),
                                      ),
                                      child: Text(
                                        itemMovie.preShow ? "预售" : "购票",
                                        style: TextStyle(
                                            fontSize: 15.0, color: colorWhite),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }, childCount: state.data.movieList.length),
            )
        ]),
  );
}
