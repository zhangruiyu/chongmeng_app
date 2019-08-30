import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MyAdoptionState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("我的发布领养"),
    ),
    body: EasyRefresh.custom(
        onRefresh: CompleterUtils.produceCompleterAction(
          dispatch,
          MyAdoptionActionCreator.onRefresh,
        ),
        firstRefreshWidget: LoadingWidget(),
        firstRefresh: true,
        slivers: <Widget>[
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            var adoption = state.data.adoption[index];
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      right: 18.0, left: 18.0, bottom: 10.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CachedNetworkImage(
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                        imageUrl: adoption.pic[0],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(adoption.petName),
                            Text("${adoption.petTypeName}" +
                                "  ${adoption.age}"),
                            Text(adoption.provincename +
                                adoption.cityname +
                                adoption.areaname),
                            RaisedButton(
                              color: Theme.of(viewService.context).accentColor,
                              onPressed: adoption.status == 10
                                  ? null
                                  : () {
                                      dispatch(MyAdoptionActionCreator
                                          .onShowAdoptionState(adoption));
                                    },
                              child: Text(adoption.status == 0
                                  ? "发布中"
                                  : adoption.status == 10
                                      ? "已被领养"
                                      : adoption.status == 0 ? "下架" : "下架"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalLine(
                  height: 5.0,
                )
              ],
            );
          }, childCount: state.data?.adoption?.length ?? 0))
        ]),
  );
}
