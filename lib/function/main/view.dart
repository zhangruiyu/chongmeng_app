import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/keep_alive_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  if (state.views == null) {
    state.views = [
      viewService.buildComponent('home'),
      Container(),
      Container(),
      Container()
    ];
  }
  if (state.mainPageIndex == 1 && state.views[1] is Container) {
    state.views.replaceRange(1, 2, [viewService.buildComponent('community')]);
  }
  if (state.mainPageIndex == 2 && state.views[2] is Container) {
    state.views.replaceRange(2, 3, [viewService.buildComponent('store')]);
  }
  if (state.mainPageIndex == 3 && state.views[3] is Container) {
    state.views.replaceRange(3, 4, [viewService.buildComponent('account')]);
  }
  return Scaffold(
    body: IndexedStack(
      children: state.views,
      index: state.mainPageIndex,
    ),
    floatingActionButton: FloatingActionButton(
      elevation: 0.0,
      onPressed: () {
//        dispatch(MainActionCreator.onSkipSelectTalkTypePage());
        NavigatorHelper.pushConversationPage(viewService.context);
      },
      child: Icon(Icons.add, semanticLabel: 'Action'),
      backgroundColor: Theme.of(viewService.context).accentColor,
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: CMBottomAppBar(
        currentIndex: state.mainPageIndex,
        color: Colors.white,
        fabLocation: FloatingActionButtonLocation.centerDocked,
        shape: CircularNotchedRectangle(),
        onTap: (int index) {
          dispatch(MainActionCreator.onChangeNewPage(index));
        },
        items: <BottomNavigationBarItemData>[
          BottomNavigationBarItemData(
            selectIcon: "assets/main_home_select.png",
            normalIcon: "assets/main_home_normal.png",
            title: '首页',
          ),
          BottomNavigationBarItemData(
            selectIcon: "assets/main_community_select.png",
            normalIcon: "assets/main_community_normal.png",
            title: '云吸',
          ),
          BottomNavigationBarItemData(
            selectIcon: "assets/main_store_select.png",
            normalIcon: "assets/main_store_normal.png",
            title: '商城',
          ),
          BottomNavigationBarItemData(
            selectIcon: "assets/main_my_select.png",
            normalIcon: "assets/main_my_normal.png",
            title: DefaultLocalizations.of(viewService.context).me,
          ),
        ]),
  );
}

class CMBottomAppBar extends StatefulWidget {
  const CMBottomAppBar({
    this.color,
    this.fabLocation,
    this.shape,
    this.items,
    this.currentIndex: 0,
    this.onTap,
  });

  final ValueChanged<int> onTap;
  final Color color;
  final int currentIndex;
  final FloatingActionButtonLocation fabLocation;
  final NotchedShape shape;
  final List<BottomNavigationBarItemData> items;

  @override
  _CMBottomAppBarState createState() => _CMBottomAppBarState();
}

class _CMBottomAppBarState extends State<CMBottomAppBar> {
  static final List<FloatingActionButtonLocation> kCenterLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  addItem(List<Widget> rowContents, int index, BuildContext context) {
    var item = widget.items[index];
    rowContents.add(
      Expanded(
        child: new InkResponse(
          onTap: () {
            widget.onTap(index);
          },
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IndexedStack(
                index: widget.currentIndex == index ? 1 : 0,
                children: <Widget>[
                  Image.asset(
                    item.normalIcon,
                  ),
                  Image.asset(
                    item.selectIcon,
                  ),
                ],
              ),
              new Text(
                item.title,
                style: TextStyle(
                    color: widget.currentIndex == index
                        ? Theme.of(context).accentColor
                        : color333333,
                    fontSize: 10.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowContents = <Widget>[];
    addItem(rowContents, 0, context);
    addItem(rowContents, 1, context);
    if (kCenterLocations.contains(widget.fabLocation)) {
      rowContents.add(
        const Expanded(child: SizedBox()),
      );
    }
    addItem(rowContents, 2, context);
    addItem(rowContents, 3, context);

    return BottomAppBar(
      color: widget.color,
      child: SizedBox(
        height: 49.0,
        child: Row(children: rowContents),
      ),
      shape: widget.shape,
    );
  }
}

class BottomNavigationBarItemData {
  final String normalIcon;
  final String selectIcon;
  final String title;

  BottomNavigationBarItemData({this.normalIcon, this.selectIcon, this.title});
}
