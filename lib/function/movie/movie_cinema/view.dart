import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

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
          SizedBox(
            height: 120,
            child: ListView.builder(
              controller: state.movieScrollController,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                int realIndex = index - state.hideCount;
                if (realIndex < 0) {
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
