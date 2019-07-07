import 'dart:math';

import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/color_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/date_picker.dart';
import 'package:flutter_cupertino_date_picker/date_picker_i18n.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AddTallyState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("添加新笔记"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              dispatch(AddTallyActionCreator.onAddTally());
            },
            child: Container(
              alignment: Alignment.center,
              child: Text("完成"),
            ),
          ),
        )
      ],
    ),
    body: ChipTheme(
      data: Theme.of(viewService.context).chipTheme.copyWith(
              shape: BeveledRectangleBorder(
            side: const BorderSide(
                width: 0.66, style: BorderStyle.solid, color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          )),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 2.0),
              itemBuilder: (BuildContext context, int index) {
                var id = index;
                return FilterChip(
                  selectedColor: Theme.of(viewService.context).accentColor,
                  backgroundColor: ColorUtils.randomColor(index.toString()),
                  label: Text("洗澡"),
                  selected: state.selectId.contains(id),
                  onSelected: (bool value) {
                    dispatch(AddTallyActionCreator.onSetChipCheck(id));
                  },
                );
              },
              itemCount: 9,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 20.0),
            child: TextField(
                controller: state.remarkTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
                  labelText: "备注(可不添加)",
                ),
                buildCounter: (BuildContext context,
                        {int currentLength, int maxLength, bool isFocused}) =>
                    null,
                style: TextStyle(
                  fontSize: 20.0,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 20.0),
            child: TextField(
                controller: state.priceTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
                  labelText: "金额(可不添加)",
                ),
                buildCounter: (BuildContext context,
                        {int currentLength, int maxLength, bool isFocused}) =>
                    null,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 20.0,
                )),
          ),
          Container(
            width: WindowUtils.getScreenWidth() - 38 * 2,
            height: 45.0,
            margin: const EdgeInsets.only(top: 22.0, left: 38, right: 38),
            child: RaisedButton(
              elevation: 0.0,
              color: Theme.of(viewService.context).accentColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(22.0)),
              child: Text(
                  state.takeDate == null ? "设置生效时间" : "生效时间:${state.takeDate}"),
              textColor: colorWhite,
              onPressed: () {
                DatePicker.showDatePicker(viewService.context,
                    locale: DateTimePickerLocale.zh_cn,
                    onConfirm: (DateTime dateTime, List<int> selectedIndex) {
                  dispatch(AddTallyActionCreator.onSetDate(dateTime));
                });
              },
            ),
          ),
        ],
      ),
    ),
  );
}
