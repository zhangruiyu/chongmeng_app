import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/widget/back_button_arrows.dart';
import 'package:chongmeng/widget/sliver_app_bar_delegate.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended;
import 'action.dart';
import 'state.dart';

Widget buildView(
    SearchState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  var buildAdapter = viewService.buildAdapter();
  return Scaffold(
    body: extended.NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: of.accentColor,
            pinned: true,
            elevation: 0.0,
            floating: true,
            primary: true,
            leading: new IconButton(
                padding: const EdgeInsets.all(0.0),
                icon: Icon(Icons.arrow_back),
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                onPressed: () {
                  Navigator.maybePop(context);
                }),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 22.0),
                child: InkResponse(
                  onTap: () {
                    dispatch(SearchActionCreator.onSearch());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("搜索"),
                  ),
                ),
              )
            ],
            title: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    new Icon(
                      Icons.search,
                      size: 25.0,
                      color: of.accentColor,
                    ),
                    Expanded(
                      child: TextField(
                        scrollPadding: const EdgeInsets.all(0.0),
                        controller: state.textEditingController,
                        textInputAction: TextInputAction.search,
                        onSubmitted: (str) {
                          dispatch(SearchActionCreator.onSearch());
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            hintText: "",
                            hintStyle:
                                TextStyle(color: colorD1D0D0, fontSize: 12.0)),
                        autofocus: true,
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0x96ffffff),
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
            ),
          )
        ];
      },
      body: EasyRefresh.custom(
        onRefresh: CompleterUtils.produceCompleterAction(
          dispatch,
          SearchActionCreator.onRefresh,
        ),
        onLoad: CompleterUtils.produceCompleterAction(
          dispatch,
          SearchActionCreator.onLoadMore,
        ),
        slivers: <Widget>[
          if (state.pageState == SearchState.EMPTY ||
              state.pageState == SearchState.INIT)
            SliverToBoxAdapter(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: buildEmptyView(state, dispatch)),
            ),
          if (state.pageState == SearchState.HASDATA)
            SliverList(
              delegate: SliverChildBuilderDelegate(buildAdapter.itemBuilder,
                  childCount: buildAdapter.itemCount),
            )
        ],
      ),
    ),
  );
}

List<Row> buildEmptyView(SearchState state, Dispatch dispatch) {
  return state.recommendChip.map((itemListTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: itemListTitle
          .map(
            (itemTitle) => ActionChip(
              label: Text(itemTitle),
              onPressed: () {
                state.textEditingController.text = itemTitle;
                dispatch(SearchActionCreator.onSearch());
              },
            ),
          )
          .toList(),
    );
  }).toList();
}
