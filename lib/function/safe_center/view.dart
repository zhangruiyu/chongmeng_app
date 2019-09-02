import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SafeCenterState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("安全中心"),
    ),
    body: Column(
      children: <Widget>[
        ListTile(
          onTap: () {},
          title: Text("手机号"),
          trailing: Text("152*******1"),
        ),
        VerticalLine(
          height: 1.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset('assets/qq.png'),
              Switch(value: true, onChanged: (bool value) {})
            ],
          ),
        ),
        VerticalLine(
          height: 1.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset('assets/wechat.png'),
              Switch(value: false, onChanged: (bool value) {})
            ],
          ),
        ),
        VerticalLine(
          height: 1.0,
        ),
      ],
    ),
  );
}
