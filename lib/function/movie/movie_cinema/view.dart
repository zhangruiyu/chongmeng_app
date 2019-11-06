import 'dart:io';

import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/vertical_line.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MovieCinemaState state, Dispatch dispatch, ViewService viewService) {
  var itemWidth = WindowUtils.getScreenWidth() / 5;
  return Scaffold(
    appBar: Toolbar(
      title: Text(state.movieScheduleData.nm),
    ),
    body: Column(
      children: <Widget>[
        if (state.cinemaMovies != null)
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(state.cinemaMovies.showData.cinemaName,
                            style: TextStyle(fontSize: 18)),
                        Text(
                          state.cinemaMovies.cinemaData.addr,
                          style: TextStyle(fontSize: 12, color: color7E7E7E),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalLine(
                  width: 1,
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () async {
                      String localAdd = Uri.encodeFull(
                          "${state.cinemaMovies.cinemaData.nm} (${state.cinemaMovies.cinemaData.addr})");
                      String url = Platform.isAndroid
                          ? 'geo:${state.cinemaMovies.cinemaData.lat},${state.cinemaMovies.cinemaData.lng}?q=$localAdd)")}'
                          : 'https://maps.apple.com/?q=$localAdd&ll=${state.cinemaMovies.cinemaData.lat},${state.cinemaMovies.cinemaData.lng}';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        showToast("请安装地图软件");
                      }
                    },
                    icon: Icon(
                      MdiIcons.mapMarkerRadius,
                      color: Colors.blue[300],
                    ),
                  ),
                )
              ],
            ),
          ),
        if (state.cinemaMovies != null)
          Container(
            color: Colors.grey,
            height: 120,
            child: ListView.builder(
              controller: state.movieScrollController,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                int realIndex = index - state.hideCount;
                if (realIndex < 0 ||
                    realIndex >= state.cinemaMovies.showData.movies.length) {
                  return AnimatedContainer(
                    width: itemWidth,
                    duration: Duration(milliseconds: 200),
                  );
                }
                var itemCinemaMovie =
                    state.cinemaMovies.showData.movies[realIndex];
                return GestureDetector(
                  onTap: () {
                    dispatch(
                        MovieCinemaActionCreator.onChangeMovieIndex(realIndex));
                  },
                  child: AnimatedContainer(
                    width: itemWidth,
                    padding: EdgeInsets.all(
                        state.selectIndex == realIndex ? 2.0 : 10.0),
                    child: ExtendedImage.network(
                        itemCinemaMovie.img.replaceAll("w.h", "148.208")),
                    duration: Duration(milliseconds: 500),
                  ),
                );
              },
              itemCount: state.cinemaMovies.showData.movies.length + 4,
              scrollDirection: Axis.horizontal,
            ),
          )
      ],
    ),
  );
}
