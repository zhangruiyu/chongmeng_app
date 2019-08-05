import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    IntegralRecordState state, Dispatch dispatch, ViewService viewService) {
  var accentColor = Theme.of(viewService.context).accentColor;
  var dividerColor = Theme.of(viewService.context).dividerColor;
  println(state.data.length);
  return Scaffold(
    appBar: Toolbar(
      title: Text("我的萌镚"),
    ),
    body: Column(
      children: <Widget>[
        Container(
          height: 50.0,
          alignment: Alignment.center,
          width: double.infinity,
          color: accentColor,
          child: Text("总萌镚:${state.totalIntegral}个"),
        ),
        Expanded(
          child: EasyRefresh.custom(
//            enableControlFinishLoad: true,
//            enableControlFinishRefresh: true,
            onRefresh: CompleterUtils.produceCompleterAction(
              dispatch,
              IntegralRecordActionCreator.onRefresh,
            ),
            firstRefresh: true,
            firstRefreshWidget: LoadingWidget(),
            onLoad: CompleterUtils.produceCompleterAction(
              dispatch,
              IntegralRecordActionCreator.onLoadMore,
            ),
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  var itemData = state.data[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: dividerColor,
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                      ),
                      color: colorWhite,
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              itemData.remake,
                              style:
                                  TextStyle(fontSize: 17.0, color: color343434),
                            ),
                            Text(
                              itemData.createTime,
                              style:
                                  TextStyle(fontSize: 14.0, color: color7E7E7E),
                            ),
                          ],
                        ),
                        Text(
                          "+${itemData.integral}",
                          style: TextStyle(color: accentColor, fontSize: 20),
                        ),
                      ],
                    ),
                  );
                }, childCount: state.data.length),
              )
            ],
          ),
        )
      ],
    ),
  );
}
