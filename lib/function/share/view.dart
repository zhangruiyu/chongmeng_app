import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:umengshare/umengshare.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ShareState state, Dispatch dispatch, ViewService viewService) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildShareItem(state, "assets/qq.png", "QQ", UMSharePlatform.QQ),
              _buildShareItem(
                  state, "assets/qq_zone.png", "QQ空间", UMSharePlatform.Qzone),
            ],
          ),
          Row(
            children: <Widget>[
              _buildShareItem(state, "assets/wechat.png", "微信",
                  UMSharePlatform.WechatSession),
              _buildShareItem(state, "assets/wechat_time_line.png", "朋友圈",
                  UMSharePlatform.WechatTimeLine),
            ],
          ),
          VerticalLine(),
          InkWell(
            onTap: () {
              Navigator.pop(viewService.context);
            },
            child: Container(
              alignment: Alignment.center,
              width: WindowUtils.getScreenWidth(),
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text("取消"),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _buildShareItem(
    ShareState state, String image, String name, UMSharePlatform platformType) {
  return Expanded(
    child: InkWell(
      onTap: () {
        if (state.args['type'] == ShareState.text) {
          UMengShare.shareText(platformType, state.args['content']);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Image.asset(image),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                name,
                style: TextStyle(color: color333333, fontSize: 15.0),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
