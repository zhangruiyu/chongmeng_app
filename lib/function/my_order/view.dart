import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'action.dart';
import 'state.dart';

var statusText = [
  "等待审核",
  "审核通过",
  "发货",
  "订单完成",
  "失败",
];

Widget buildView(
    MyOrderState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    backgroundColor: colorWhite,
    appBar: Toolbar(
      title: Text("我的订单"),
    ),
    body: EasyRefresh.custom(
        onRefresh: CompleterUtils.produceCompleterAction(
          dispatch,
          MyOrderActionCreator.onRefresh,
        ),
        slivers: [
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              var itemData = state.data[index];
              return Column(
                children: <Widget>[
                  Container(
                    height: WindowUtils.getScreenWidth() / 3,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            width: WindowUtils.getScreenWidth() / 3,
                            fit: BoxFit.cover,
                            imageUrl: itemData.pic[0],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(itemData.name),
                            Text("${itemData.integral.abs()}萌镚"),
                            Text(
                              itemData.createTime,
                              style: of.textTheme.caption,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Text(
                              "X${itemData.count}",
                              textAlign: TextAlign.end,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  VerticalLine(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 8.0),
                        child: Text(statusText[itemData.status]),
                      ),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 8.0),
                          child: Text("查看收件信息"),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  VerticalLine(
                    height: 10.0,
                  )
                ],
              );
            }, childCount: state.data?.length ?? 0),
          )
        ]),
  );
}
