import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/function/pet/selecttype/model/pet_type_entity.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/model/local_user.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    AccountState state, Dispatch dispatch, ViewService viewService) {
  var theme = Theme.of(viewService.context);
  var user = GlobalStore.store.getState().localUser;
  return user == null
      ? buildNoLoginView(theme, viewService)
      : buildLoginView(theme, viewService, user);
}

Widget buildLoginView(
    ThemeData theme, ViewService viewService, LocalUser user) {
  println(user.avatar);
  return Column(
    children: <Widget>[
      Container(
        color: theme.accentColor,
        padding: EdgeInsets.only(left: 20.0, bottom: 30.0, top: 30.0),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              user.avatar?.isEmpty == false
                  ? ClipOval(
                      child: CachedNetworkImage(
                      width: 50.0,
                      imageUrl: user.avatar,
                    ))
                  : CircleAvatar(
                      child: Image.asset(
                        'assets/account_page_no_login.png',
                        width: 50.0,
                      ),
                      backgroundColor: colorWhite,
                    ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      viewService.context, PageConstants.AutoPage);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        user.nickName,
                        style: theme.textTheme.subhead,
                      ),
                      Text(
                        user.description?.isEmpty == true
                            ? "这个人很懒,什么也没有留下~"
                            : user.description,
                        style: TextStyle(fontSize: 12.0, color: color343434),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //关注 宠物
      Container(
        color: theme.accentColor,
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[Text("0"), Text("关注")],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[Text("0"), Text("粉丝")],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[Text("1"), Text("协议")],
              ),
            ),
            Expanded(
              child: InkResponse(
                onTap: () async {
                  var petTypeEntity =
                      await RequestClient.request<PetTypeEntity>(
                          viewService.context, HttpConstants.PetType);
                  if (petTypeEntity.hasSuccess) {
                    Navigator.popAndPushNamed(
                        viewService.context, PageConstants.SelectTypePage,
                        arguments: {'petTypeEntity': petTypeEntity.data.data});
                  }
                },
                child: Column(
                  children: <Widget>[Text("1"), Text("宠物")],
                ),
              ),
            )
          ],
        ),
      ),
      ListTile(
        onTap: () {},
        title: Text("积分记录"),
        trailing: new Icon(
          Icons.keyboard_arrow_right,
          size: 30.0,
          color: const Color(0x40808080),
        ),
      ),
      VerticalLine(),
      ListTile(
        onTap: () {
          UserHelper.loginCheck(viewService.context, () {
            Navigator.pushNamed(viewService.context, PageConstants.SettingPage);
          });
        },
        title: Text("设置"),
        trailing: new Icon(
          Icons.keyboard_arrow_right,
          size: 30.0,
          color: const Color(0x40808080),
        ),
      ),
    ],
  );
}

Container buildNoLoginView(ThemeData theme, ViewService viewService) {
  return Container(
    color: theme.accentColor,
    padding: EdgeInsets.only(left: 20.0, bottom: 30.0, top: 30.0),
    child: SafeArea(
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Image.asset('assets/account_page_no_login.png'),
            backgroundColor: colorWhite,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(viewService.context, PageConstants.AutoPage);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "登录/注册",
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
