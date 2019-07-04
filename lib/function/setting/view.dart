import 'package:chongmeng/global_store/action.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SettingState state, Dispatch dispatch, ViewService viewService) {
  var user = GlobalStore.store.getState().localUser;
  var edgeInsets = new EdgeInsets.only(top: 10.0);
  const textStyle = const TextStyle();
  return new Scaffold(
      appBar: new Toolbar(
        title: new Text('关于'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(top: 40.0),
            color: const Color(0xffffffff),
            child: new Column(children: <Widget>[
              new Image.asset(
                'assets/account_page_no_login.png',
                width: 40.0,
                height: 40.0,
              ),
              new Padding(
                padding: edgeInsets,
                child: new Text('版本号: v1.0.0'),
              ),
              new Padding(
                padding: edgeInsets,
                child: new Text('QQ服务群: 609487304'),
              ),
              new Padding(
                padding: edgeInsets,
                child: new Text('如有建议和问题,请加入群反馈'),
              ),
              new FlatButton(
                  onPressed: () {
                    /*SnackBarUtils.showSnackBar(
                        scaffoldStateKey.currentState, '个人作品,欢迎加入');*/
                  },
                  padding: const EdgeInsets.symmetric(
                      vertical: 13.0, horizontal: 4.0),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Align(
                          child: new Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: new Text(
                              '关于我们',
                              style: textStyle,
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        new Icon(Icons.arrow_right),
                      ])),
              new FlatButton(
                  onPressed: () {},
                  padding: const EdgeInsets.symmetric(
                      vertical: 13.0, horizontal: 4.0),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Align(
                          child: new Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: new Text(
                              '版本更新',
                              style: textStyle,
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        new Icon(Icons.arrow_right),
                      ])),
              // onSubmitted：当用户在键盘上点击完成编辑时调用
            ]),
          ),
          user == null
              ? null
              : new FlatButton(
                  padding: new EdgeInsets.only(
                      bottom: WindowUtils.isIPhoneX(viewService.context)
                          ? 26.0
                          : 0.0),
                  child: new SizedBox(
                      width: WindowUtils.getScreenWidth(),
                      height: 45.0,
                      child: new Center(
                        child: new Text(
                          '退出登录',
                          textAlign: TextAlign.center,
                          style: new TextStyle(fontSize: 18.0),
                        ),
                      )),
                  onPressed: () async {
                    UserHelper.logout(null);
                    GlobalStore.store
                        .dispatch(GlobalActionCreator.onLoginOut());
                    Navigator.of(viewService.context).pop();
                  },
                  color: Theme.of(viewService.context).accentColor,
                ),
        ].where((Object o) => o != null).toList(),
      ));
}