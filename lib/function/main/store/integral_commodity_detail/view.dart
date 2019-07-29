import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/main/store/integral_component/view.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(IntegralCommodityDetailState state, Dispatch dispatch,
    ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    backgroundColor: colorWhite,
    appBar: Toolbar(
      title: Text("商品详情"),
    ),
    body: Column(
      children: <Widget>[
        Flexible(
          fit: FlexFit.loose,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  transitionOnUserGestures: true,
                  tag: state.index.toString(),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: state.itemData.pic[0],
                    width: WindowUtils.getScreenWidth(),
                    height: WindowUtils.getScreenWidth() * 0.55,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(state.itemData.name),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "库存${state.itemData.count}件",
                          style: of.textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalLine(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("兑换数量"),
                      Text("1个"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 18.0, left: 18.0, right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("可用萌镚"),
                      Text(state.totalIntegral == null
                          ? "正在获取"
                          : state.totalIntegral.toString()),
                    ],
                  ),
                ),
                VerticalLine(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 18.0, left: 18.0, right: 18.0, bottom: 5.0),
                  child: Text("商品简介"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Text(
                    state.itemData.details,
                    style: of.textTheme.caption,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 18.0),
                  child: Text(
                    "发货时间",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Text(
                    "商品兑换成功后会在每周五根据您所填写的默认地址统一邮寄发放。",
                    style: of.textTheme.caption,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 18.0),
                  child: Text(
                    "填写地址",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Text(
                    "使用手机的用户,请打开宠萌APP,进入账户页-收货地址-去设置您的收货地址",
                    style: of.textTheme.caption,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 18.0),
                  child: Text(
                    "免责声明",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18.0, right: 18.0, bottom: 10.0),
                  child: Text(
                    "编写者(即张大头同学)拥有本活动最终解释权",
                    style: of.textTheme.caption,
                  ),
                ),
              ],
            ),
          ),
        ),
        new SizedBox(
          width: WindowUtils.getScreenWidth(),
          height: 50.0 + MediaQuery.of(viewService.context).padding.bottom,
          child: new FlatButton(
            child: new Center(
              child: new Text(
                '${state.itemData.integralPrice}萌镚兑换',
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 18.0),
              ),
            ),
            onPressed: () async {
              dispatch(IntegralCommodityDetailActionCreator.onBuy());
            },
            color: Theme.of(viewService.context).accentColor,
          ),
        ),
      ],
    ),
  );
}
