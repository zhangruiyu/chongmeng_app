import 'dart:io';

import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AdoptionAddState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    appBar: Toolbar(
      title: Text("送养信息"),
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text(
                "完善详细信息,帮助毛孩子们进入一个温馨的家吧",
                style: of.textTheme.body2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("宠物信息"),
          ),
          Card(
            color: colorWhite,
            child: Column(
              children: <Widget>[
                ...buildItem("种类", "请选择宠物种类",
                    hasArrow: true,
                    state: state,
                    dispatch: dispatch,
                    viewService: viewService),
                ...buildItem("名字", "请填写宠物名字或品种",
                    hasArrow: false,
                    state: state,
                    dispatch: dispatch,
                    viewService: viewService),
                ...buildItem("性别", "请选择宠物性别",
                    hasArrow: true,
                    state: state,
                    dispatch: dispatch,
                    viewService: viewService),
                ...buildItem("年龄", "请填写宠物年龄(X个月)",
                    hasArrow: false,
                    state: state,
                    dispatch: dispatch,
                    viewService: viewService),
              ],
            ),
          ),
          Card(
            color: colorWhite,
            child: Column(
              children: <Widget>[
                ...buildItem("免疫", "是否免疫",
                    hasArrow: true,
                    state: state,
                    dispatch: dispatch,
                    viewService: viewService),
                ...buildItem("绝育", "是否绝育",
                    hasArrow: true,
                    state: state,
                    dispatch: dispatch,
                    viewService: viewService),
                ...buildItem("驱虫", "是否驱虫",
                    hasArrow: true,
                    state: state,
                    dispatch: dispatch,
                    viewService: viewService),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("宠物照片(最多5张)和描述(性格爱好等)"),
          ),
          Card(
            color: colorWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: buildPicWidget(
                              state: state,
                              dispatch: dispatch,
                              viewService: viewService)
                          .toList(),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0, left: 10.0),
                      child: Text(
                        "描述:",
                        style: of.textTheme.subhead,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            hintText: "请填写宠物描述(300字以内)",
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("领养要求(是否需要家访一次等,请描述清楚)"),
          ),
          Card(
            color: colorWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0, left: 10.0),
                      child: Text(
                        "领养要求:",
                        style: of.textTheme.subhead,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            hintText: "请填写领养要求(300字以内)",
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("主人信息"),
          ),
          Card(
            color: colorWhite,
            child: Column(
              children: <Widget>[
                ...buildItem("送养人", "请填写送养人信息",
                    hasArrow: false,
                    state: state,
                    dispatch: dispatch,
                    viewService: viewService),
                ...buildItem("微信号", "请填写联系方式",
                    hasArrow: false,
                    state: state,
                    dispatch: dispatch,
                    viewService: viewService),
                ...buildItem("城市", "选择大致地址",
                    hasArrow: true,
                    state: state,
                    dispatch: dispatch,
                    viewService: viewService),
              ],
            ),
          ),

          Container(
            width: WindowUtils.getScreenWidth() - 38 * 2,
            height: 45.0,
            margin: const EdgeInsets.only(
                top: 22.0, left: 38, right: 38, bottom: 60.0),
            child: RaisedButton(
              elevation: 0.0,
              color: Theme.of(viewService.context).accentColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(22.0)),
              child: Text("提交"),
              textColor: colorWhite,
              onPressed: () {
                /*DatePicker.showDatePicker(viewService.context,
                    locale: DateTimePickerLocale.zh_cn,
                    onConfirm: (DateTime dateTime, List<int> selectedIndex) {
                  dispatch(AddTallyActionCreator.onSetDate(dateTime));
                });*/
              },
            ),
          ),
        ],
      ),
    ),
  );
}

List<Widget> buildPicWidget(
    {AdoptionAddState state, Dispatch dispatch, ViewService viewService}) {
  List<Widget> gridItems = new List<Widget>();
  List<UploadTask> selectedPics = state.selectPicList ?? [];
  double itemWidth = WindowUtils.getScreenWidth() / 5.toDouble();
  selectedPics.forEach((UploadTask selectedPic) {
    selectedPic.sequence = selectedPics.indexOf(selectedPic);
    Widget item = new Padding(
      padding: const EdgeInsets.all(3.0),
      child: new Image.file(
        new File(selectedPic.localUrl.toString()),
        fit: BoxFit.cover,
        width: itemWidth,
        height: itemWidth,
      ),
    );
    gridItems.add(item);
  });
  gridItems.add(Container(
    width: itemWidth,
    height: itemWidth,
    padding: const EdgeInsets.all(3.0),
    child: new IconButton(
        icon: new Icon(
          Icons.add_a_photo,
          size: 30.0,
          color: const Color(0x40808080),
        ),
        onPressed: () {
          dispatch(AdoptionAddActionCreator.onReselectPic());
        }),
  ));
  return gridItems;
}

List<Widget> buildItem(String title, String helperText,
    {bool hasArrow = false,
    AdoptionAddState state,
    Dispatch dispatch,
    ViewService viewService}) {
  var of = Theme.of(viewService.context);
  return [
    SizedBox(
      height: 50.0,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 18.0, left: 10.0),
            child: Text(
              "$title:",
              style: of.textTheme.subhead,
            ),
          ),
          Expanded(
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                  hintText: helperText, border: InputBorder.none),
            ),
          ),
          if (hasArrow)
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_right,
              ),
            )
        ],
      ),
    ),
    VerticalLine()
  ];
}
