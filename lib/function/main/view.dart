import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      leading: null,
      title: const Text('宠萌'),
    ),
    body: state.mainPageIndex == 0
        ? viewService.buildComponent('home')
        : state.mainPageIndex == 1
            ? viewService.buildComponent('community')
            : state.mainPageIndex == 2
                ? Container()
                : state.mainPageIndex == 3
                    ? viewService.buildComponent('account')
                    : viewService.buildComponent('accountr'),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        dispatch(MainActionCreator.onSkipSelectTalkTypePage());
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
            icon: Icons.home,
            title: '首页',
          ),
          BottomNavigationBarItemData(
            icon: Icons.cloud_queue,
            title: '云吸',
          ),
          BottomNavigationBarItemData(
            icon: Icons.school,
            title: '商城',
          ),
          BottomNavigationBarItemData(
            icon: Icons.account_balance,
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
          child: new ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  item.icon,
                  color: widget.currentIndex == index
                      ? Theme.of(context).accentColor
                      : Colors.black45,
                ),
                new Text(
                  item.title,
                  style: Theme.of(context).textTheme.body2.merge(new TextStyle(
                        color: widget.currentIndex == index
                            ? Theme.of(context).accentColor
                            : Colors.black45,
                      )),
                )
              ],
            ),
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
        height: 60.0,
        child: Row(children: rowContents),
      ),
      shape: widget.shape,
    );
  }
}

class BottomNavigationBarItemData {
  const BottomNavigationBarItemData({
    this.icon,
    this.title,
  });

  final IconData icon;
  final String title;

  @override
  String toString() => '$runtimeType("$title")';
}
