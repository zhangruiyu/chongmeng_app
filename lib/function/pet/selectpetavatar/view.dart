import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SelectPetAvatarState state, Dispatch dispatch, ViewService viewService) {
  var accentColor = Theme.of(viewService.context).accentColor;
  return Scaffold(
    appBar: Toolbar(
      title: Text("添加宠物"),
    ),
    body: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: GestureDetector(
            onTap: () {
              dispatch(SelectPetAvatarActionCreator.onSelectPetAvatar());
            },
            child: Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: accentColor,
                  borderRadius: BorderRadius.all((Radius.circular(70.0))),
                  image: state.petAvatar == null
                      ? null
                      : DecorationImage(
                          image: FileImage(state.petAvatar), fit: BoxFit.fill)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
          child: Text("设置宠物头像"),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 58.0, right: 58.0),
          child: TextField(
              autofocus: true,
              keyboardType: TextInputType.phone,
              controller: state.nickTextEditingController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
                  hintText: ""
                      "请输入宠物的名字",
                  hintStyle: TextStyle(
                    color: colorA4A4A4,
                    fontSize: 12.0,
                  )),
              maxLength: 11,
              buildCounter: (BuildContext context,
                      {int currentLength, int maxLength, bool isFocused}) =>
                  null,
              style: TextStyle(
                fontSize: 20.0,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 22.0, left: 22.0, top: 30.0),
          child: SizedBox(
            width: double.infinity,
            height: 45.0,
            child: RaisedButton(
              color: accentColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(22.0)),
              child: Text("完成"),
              onPressed: () {
                dispatch(SelectPetAvatarActionCreator.onAddPet());
              },
            ),
          ),
        )
      ],
    ),
  );
}
