import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RechargeState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    appBar: Toolbar(
      title: Text("充值萌镚喽"),
    ),
    body: EasyRefresh.custom(
      onRefresh: CompleterUtils.produceCompleterAction(
        dispatch,
        RechargeActionCreator.onRefresh,
      ),
      firstRefreshWidget: LoadingWidget(),
      firstRefresh: true,
      slivers: <Widget>[
        if (state.data != null)
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                //充值选项
                ...state.data.map((itemRecharge) {
                  var index = state.data.indexOf(itemRecharge);
                  bool isSelect = index == state.selectItemPosition;
                  return InkWell(
                    onTap: () {
                      dispatch(
                          RechargeActionCreator.onChangeSelectPosition(index));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              isSelect ? Colors.black.withOpacity(0.5) : null,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 2,
                              color:
                                  Theme.of(viewService.context).dividerColor)),
                      height: 60.0,
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 18.0),
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(itemRecharge.original.toString()),
                              Text("  赠送${itemRecharge.give}"),
                            ],
                          ),
                          Text("¥ ${itemRecharge.showMoney} 元"),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                Text(
                  "充值成功后,即可直接使用兑换商品",
                  style: TextStyle(fontSize: 13.0, color: color7E7E7E),
                ),
                Container(
                  width: WindowUtils.getScreenWidth() - 38 * 2,
                  height: 45.0,
                  margin: const EdgeInsets.only(top: 22.0, left: 38, right: 38),
                  child: RaisedButton(
                    elevation: 0.0,
                    color: of.accentColor,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(22.0)),
                    child: Text("立即充值"),
                    textColor: colorWhite,
                    onPressed: () {
                      dispatch(RechargeActionCreator.onPay());
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
  );
}
