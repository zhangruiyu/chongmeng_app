import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ShippingAddressState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    backgroundColor: colorWhite,
    appBar: Toolbar(
      title: Text("收货地址"),
    ),
    body: SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: EasyRefresh.custom(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      buildItem(of),
                      buildItem(of),
                      buildItem(of),
                      buildItem(of),
                      buildItem(of),
                      buildItem(of),
                      buildItem(of),
                      buildItem(of),
                      buildItem(of),
                      buildItem(of),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: WindowUtils.getScreenWidth() - 38 * 2,
            height: 45.0,
            margin: const EdgeInsets.only(
                top: 22.0, left: 38, right: 38, bottom: 20.0),
            child: RaisedButton(
              elevation: 0.0,
              color: of.accentColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(22.0)),
              child: Text("新建地址"),
              textColor: colorWhite,
              onPressed: () {
                dispatch(ShippingAddressActionCreator.onSkipAddAddress());
              },
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildItem(ThemeData of) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("张瑞宇"),
                Text("15201238101"),
              ],
            ),
            Text(
              "北京 东城区 八里庄",
              style: of.textTheme.caption,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: VerticalLine(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(
                    MdiIcons.playlistEdit,
                  ),
                  label: Text("编辑"),
                  onPressed: () {},
                ),
                FlatButton.icon(
                  icon: Icon(
                    MdiIcons.deleteOutline,
                  ),
                  label: Text("删除"),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      VerticalLine(
        height: 5.0,
      )
    ],
  );
}
