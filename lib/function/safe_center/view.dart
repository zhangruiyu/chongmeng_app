import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SafeCenterState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
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
              Row(
                children: <Widget>[
                  Image.asset('assets/qq.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      "QQ一键登录",
                      style: of.textTheme.caption,
                    ),
                  )
                ],
              ),
              Switch(
                  value: state.qqBind,
                  onChanged: (bool value) {
                    dispatch(SafeCenterActionCreator.onQQBindBackend(value));
                  })
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
              Row(
                children: <Widget>[
                  Image.asset('assets/wechat.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      "微信一键登录",
                      style: of.textTheme.caption,
                    ),
                  )
                ],
              ),
              Switch(
                  value: state.wxBind,
                  onChanged: (bool value) {
                    dispatch(SafeCenterActionCreator.onWXBindBackend(value));
                  })
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
