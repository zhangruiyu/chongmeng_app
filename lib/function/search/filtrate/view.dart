import 'package:chongmeng/constants/colors.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

double filtrateBarHeight = 48.0;

Widget buildView(
    SearchFiltrateState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Expanded(
        child: InkWell(
          child: Container(
            alignment: Alignment.center,
            height: filtrateBarHeight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  "综合",
                  style: TextStyle(color: colorWhite),
                ),
              ),
            ),
          ),
          onTap: () {},
        ),
      ),
      Expanded(
        child: InkWell(
          child: Container(
            alignment: Alignment.center,
            height: filtrateBarHeight,
            child: Text(
              "销量",
              style: TextStyle(color: colorWhite),
            ),
          ),
          onTap: () {},
        ),
      ),
      Expanded(
        child: InkWell(
          child: Container(
            alignment: Alignment.center,
            height: filtrateBarHeight,
            child: Text(
              "价格",
              style: TextStyle(color: colorWhite),
            ),
          ),
          onTap: () {},
        ),
      ),
    ],
  );
}
