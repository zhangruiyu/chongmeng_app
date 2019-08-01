import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AdoptionState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("领养中心"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              UserHelper.loginCheck(viewService.context, () {
                Navigator.pushNamed(
                    viewService.context, PageConstants.AdoptionAddPage);
              });
            },
            child: Container(
              alignment: Alignment.center,
              child: Text("发布更多"),
            ),
          ),
        )
      ],
    ),
    body: EasyRefresh.custom(
      onRefresh: CompleterUtils.produceCompleterAction(
        dispatch,
        AdoptionActionCreator.onRefresh,
      ),
      firstRefreshWidget: LoadingWidget(),
      firstRefresh: true,
      slivers: <Widget>[
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Text("");
          }),
        )
      ],
    ),
  );
}
