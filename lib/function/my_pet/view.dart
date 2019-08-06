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

Widget buildView(MyPetState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(title: Text("我的宠物")),
    body: Column(
      children: <Widget>[
        Expanded(
          child: EasyRefresh.custom(
            slivers: [],
            onRefresh: CompleterUtils.produceCompleterAction(
              dispatch,
              MyPetActionCreator.onRefresh,
            ),
            firstRefreshWidget: LoadingWidget(),
            firstRefresh: true,
          ),
        ),
        new Container(
          width: WindowUtils.getScreenWidth(),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(viewService.context).padding.bottom + 30.0,
              left: 30.0,
              right: 30.0),
          height: 50.0,
          child: new RaisedButton(
            child: new Text(
              '添加宠物',
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 18.0, color: colorWhite),
            ),
            onPressed: () {
              dispatch(MyPetActionCreator.onSkipAddPetPage());
            },
            color: Theme.of(viewService.context).accentColor,
          ),
        ),
      ],
    ),
  );
}
