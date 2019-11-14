import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/empty_widget.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'state.dart';

var statusText = [
  "等待审核",
  "审核通过",
  "发货中",
  "已完成",
  "失败",
];

Widget buildView(
    MyOrderState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    backgroundColor: of.dividerColor,
    appBar: Toolbar(
      title: Text("我的订单"),
    ),
    body: EasyRefresh.custom(
        firstRefresh: true,
        emptyWidget: state.data?.isEmpty == true ? EmptyWidget() : null,
        firstRefreshWidget: LoadingWidget(),
        onRefresh: CompleterUtils.produceCompleterAction(
          dispatch,
          MyOrderActionCreator.onRefresh,
        ),
        slivers: [
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              var itemData = state.data[index];
              return Container(
                color: Theme.of(viewService.context).dividerColor,
                child: Card(
                  elevation: 0.5,
                  margin: EdgeInsets.only(
                      top: 12.0,
                      left: 18.0,
                      right: 18.0,
                      bottom: state.data.length == (index + 1) ? 12.0 : 0.0),
                  child: InkWell(
                    onTap: itemData.virtualProduct == null
                        ? null
                        : () {
                            dispatch(MyOrderActionCreator.onSkipReviewPage(
                                itemData));
                          },
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(
                              top: 16.0, left: 12, right: 12, bottom: 23),
                          height: WindowUtils.getScreenWidth() / 3,
                          child: Row(
                            children: <Widget>[
                              ExtendedImage.network(
                                itemData.pic.first,
                                cache: true,
                                width: 85,
                                height: 85,
                                fit: BoxFit.cover,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  height: 85,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Text(
                                              itemData.name,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: color333333),
                                            ),
                                          )),
                                          Text(
                                            statusText[itemData.status],
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: of.accentColor),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("${itemData.integral.abs()}萌币",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: color333333)),
                                          Text("x${itemData.count}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: color333333))
                                        ],
                                      ),
                                      Text(itemData.createTime,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: color999999)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: VerticalLine(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 5.0),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    dispatch(
                                        MyOrderActionCreator.onShowOrderAddress(
                                            itemData));
                                  },
                                  child: Text("查看收件信息",
                                      style: TextStyle(
                                          fontSize: 13, color: color333333)),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                        width: 0.5, color: colorCCCCCC)),
                              ),
                            ),
                            if (itemData.virtualProduct != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 5.0),
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      dispatch(
                                          MyOrderActionCreator.onSkipReviewPage(
                                              itemData));
                                    },
                                    child: Text("二维码",
                                        style: TextStyle(
                                            fontSize: 13, color: color333333)),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(
                                          width: 0.5, color: colorCCCCCC)),
                                ),
                              ),
                            if (itemData.expressType != null &&
                                itemData.expressNumber != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 5.0),
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      dispatch(
                                          MyOrderActionCreator.onShowExpress(
                                              itemData));
                                    },
                                    child: Text("查看快递信息",
                                        style: TextStyle(
                                            fontSize: 13, color: color333333)),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(
                                          width: 0.5, color: colorCCCCCC)),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }, childCount: state.data?.length ?? 0),
          )
        ]),
  );
}
