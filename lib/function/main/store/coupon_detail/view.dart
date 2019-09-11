import 'package:chongmeng/anim/slide_transition_x.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CouponDetailState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
//    backgroundColor: of.accentColor,
    appBar: Toolbar(
      title: Text("饿了么超大包"),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Card(
              margin: const EdgeInsets.all(12.0),
              color: colorWhite,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedSwitcher(
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    var tween =
                        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                    return SlideTransitionX(
                      child: child,
                      direction: AxisDirection.left, //上入下出
                      position: animation,
                    );
                  },
                  duration: Duration(milliseconds: 500),
                  child: state.data?.isNotEmpty == true
                      ? Container(
                          key: ValueKey("show"),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text("恭喜您,消耗40积分兑换成功"),
                              ),
                              ...state.data.map((itemCoupon) {
                                return Container(
                                    width: double.infinity,
                                    height: 45.0,
                                    margin: const EdgeInsets.only(
                                        top: 22.0, left: 38, right: 38),
                                    child: RaisedButton(
                                      color: of.accentColor,
                                      onPressed: () {
                                        dispatch(CouponDetailActionCreator
                                            .onGetCoupon());
                                      },
                                      child: Text(
                                        "${state.data.indexOf(itemCoupon) + 1}, 满${itemCoupon.threshold}减${itemCoupon.amount} ${itemCoupon.title}",
                                        style: TextStyle(color: colorWhite),
                                      ),
                                    ));
                              }).toList(),
                              Container(
                                  width: double.infinity,
                                  height: 45.0,
                                  margin: const EdgeInsets.only(
                                      top: 22.0, left: 38, right: 38),
                                  child: RaisedButton(
                                    color: of.accentColor,
                                    onPressed: () {
                                      dispatch(
                                          CouponDetailActionCreator.onSetCoupon(
                                              null));
                                      state.telEditingController.clear();
                                    },
                                    child: Text(
                                      "换其他手机号再领一次",
                                      style: TextStyle(color: colorWhite),
                                    ),
                                  )),
                              Container(
                                  width: double.infinity,
                                  height: 45.0,
                                  margin: const EdgeInsets.only(
                                      top: 22.0, left: 38, right: 38),
                                  child: RaisedButton(
                                    color: of.accentColor,
                                    onPressed: () {
                                      dispatch(CouponDetailActionCreator
                                          .onOpenEleme());
                                    },
                                    child: Text(
                                      "打开饿了吗,立即使用",
                                      style: TextStyle(color: colorWhite),
                                    ),
                                  )),
                            ],
                          ),
                        )
                      : Column(
                          key: ValueKey("get"),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Text(
                                "请输入您的饿了么手机号",
                                style: TextStyle(color: color7E7E7E),
                              ),
                            ),
                            TextField(
                              controller: state.telEditingController,
                              textInputAction: TextInputAction.go,
                              onSubmitted: (str) {
                                dispatch(
                                    CouponDetailActionCreator.onGetCoupon());
                              },
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    state.telEditingController.clear();
                                  },
                                  child: Icon(Icons.clear),
                                ),
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Color(0xfff1f1f1),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    )),
                              ),
                              autofocus: true,
                              maxLines: 1,
                              maxLength: 11,
                              buildCounter: (BuildContext context,
                                      {int currentLength,
                                      int maxLength,
                                      bool isFocused}) =>
                                  null,
                              keyboardType: TextInputType.phone,
                              style: TextStyle(fontSize: 17.0),
                            ),
                            Container(
                                width: double.infinity,
                                height: 45.0,
                                margin: const EdgeInsets.only(
                                    top: 22.0, left: 38, right: 38),
                                child: RaisedButton(
                                  color: of.accentColor,
                                  onPressed: () {
                                    dispatch(CouponDetailActionCreator
                                        .onGetCoupon());
                                  },
                                  child: Text(
                                    "马上领取",
                                    style: TextStyle(color: colorWhite),
                                  ),
                                ))
                          ],
                        ),
                ),
              )),
          Card(
            margin: const EdgeInsets.all(12.0),
            color: of.accentColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Text(
                        "不是100%成功，若一直失败联系客服。",
                        style: TextStyle(color: colorWhite),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 20.0),
                    child: VerticalLine(
                      height: 1.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "1、领取[饿了么超大包]需要花费5积分，失败不扣积分，领取后在[饿了么APP]内查看，不要用小程序。",
                      style: TextStyle(color: colorWhite),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "2、超大包不是100%成功，少量手机号有问题会领取失败，换个手机号试试。一直失败的话，联系客服协助您解决。支持店铺满减，如图：点击查看。",
                      style: TextStyle(color: colorWhite),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "3、每个手机号每天限领1次，领过的手机号请明天再来，或换个手机号领",
                      style: TextStyle(color: colorWhite),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "4、超大包随机出[品质联盟]券和[全场通用]券：满减条件（20~40），金额（4~15）随机出。领取后有效期当天，尽快使用。",
                      style: TextStyle(color: colorWhite),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "5、客服QQ群（有问题随时联系）：609487304",
                      style: TextStyle(color: colorWhite),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
