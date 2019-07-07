import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SelectTypeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("添加宠物"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              NavigatorHelper.popToMain(viewService.context);
            },
            child: Container(
              alignment: Alignment.center,
              child: Text("跳过"),
            ),
          ),
        )
      ],
    ),
    body: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: Text("添加宠物后,您可获得更精准的服务哦"),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    dispatch(SelectTypeActionCreator.onSkipSelectSubTypePage(
                      state.data[index].id,
                    ));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: CachedNetworkImage(
                          imageUrl: state.data[index].image,
                          width: 60.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(20.0)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          state.data[index].name,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: state.data.length,
          ),
        )
      ],
    ),
  );
}
