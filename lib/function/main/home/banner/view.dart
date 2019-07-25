import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:chongmeng/widget/oval_swiper_pagination_builder.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'action.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'state.dart';

Widget buildView(
    BannerState state, Dispatch dispatch, ViewService viewService) {
  var accentColor = Theme.of(viewService.context).accentColor;
  return Container(
      height: 174.0,
      padding: EdgeInsets.only(
        top: 13.0,
      ),
      child:
          /*(state?.bannerData?.banners?.length ?? 0) == 0
          ? Container()
          : */
          new Swiper(
        itemBuilder: (BuildContext context, int index) {
          HomeDataBanner itemBanner = state.bannerData[index];
          return GestureDetector(
            onTap: () {
              dispatch(BannerActionCreator.onSkipWebViewPage(itemBanner));
            },
            child: Container(
              height: 150.0,
              child: new CachedNetworkImage(
                imageUrl: itemBanner.pictUrl,
                fit: BoxFit.fill,
                errorWidget: (b, c, e) {
                  return new Container();
                },
              ),
            ),
          );
        },
        itemCount: state.bannerData.length,
//        viewportFraction: 0.8,
//        scale: 0.75,
        outer: false,
        autoplay: true,
        pagination: new SwiperPagination(
            builder: OvalSwiperPaginationBuilder(
                color: Color(0xffE1DEDE),
                activeColor: accentColor,
                activeSize: 20.0)),
//        layout: SwiperLayout.STACK,
//        control: new SwiperControl(),
      ));
}
