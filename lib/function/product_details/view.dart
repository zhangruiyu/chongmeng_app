import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:chongmeng/widget/oval_swiper_pagination_builder.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    ProductDetailsState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  var itemData = state.itemData;
  return Scaffold(
      body: EasyRefresh.custom(
    firstRefresh: true,
    firstRefreshWidget: LoadingWidget(),
    /* onRefresh: CompleterUtils.produceCompleterAction(
  dispatch,
  ProductDetailsActionCreator.onRefresh,
    ),*/
    slivers: <Widget>[
      SliverAppBar(
        brightness: Brightness.light,
        leading: BackButton(
          color: colorBack,
        ),
        backgroundColor: Colors.transparent,
        expandedHeight: WindowUtils.getScreenWidth(),
        flexibleSpace: FlexibleSpaceBar(
          background: buildBanner(itemData, of),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(itemData.title),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "券后价 ",
                              style: TextStyle(
                                  fontSize: 12.0, color: of.accentColor)),
                          TextSpan(
                              text: "¥${itemData.favourablePrice}",
                              style: TextStyle(
                                  fontSize: 18.0, color: of.accentColor)),
                        ],
                      ),
                    ),
                    Text("已售 ${itemData.volume}件",
                        style: of.textTheme.caption
                            .merge(TextStyle(color: colorA4A4A4))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "原价 ¥${itemData.zkFinalPriceWap}",
                      style: of.textTheme.caption
                          .merge(TextStyle(color: colorA4A4A4)),
                    ),
                  ],
                ),
              ),

              //券金额
              Container(
                width: WindowUtils.getScreenWidth() - 38 * 2,
                margin: const EdgeInsets.only(top: 5.0, left: 38, right: 38),
//                padding: const EdgeInsets.only(top: 22.0, bottom: 22.0),
                height: 70.0,
                alignment: Alignment.center,
                child: RaisedButton(
                  elevation: 0.0,
                  color: of.accentColor,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "¥${itemData.couponValue}",
                                    style: TextStyle(
                                        fontSize: 24.0, color: colorWhite)),
                                TextSpan(
                                    text: "元优惠券",
                                    style: TextStyle(
                                        fontSize: 14.0, color: colorWhite)),
                              ],
                            ),
                          ),
                          Text(
                            "使用期限: ${itemData.couponStartTime}~${itemData.couponEndTime}",
                            style: of.textTheme.caption.merge(
                                TextStyle(color: colord9d9d9, fontSize: 12.0)),
                          )
                        ],
                      ),
                      Text("立即领券"),
                    ],
                  ),
                  textColor: colorWhite,
                  onPressed: () {
                    launch(itemData.couponClickUrl);
                  },
                ),
              )
            ],
          )
        ]),
      )
    ],
  ));
}

SizedBox buildBanner(AliProductItem itemData, ThemeData of) {
  return SizedBox(
    width: double.infinity,
    height: WindowUtils.getScreenWidth(),
    child: new Swiper(
      itemBuilder: (BuildContext context, int index) {
        String itemBanner = itemData.smallImages.string[index];
        return new CachedNetworkImage(
          imageUrl: itemBanner,
          fit: BoxFit.fill,
          errorWidget: (b, c, e) {
            return new Container();
          },
        );
      },
      itemCount: itemData.smallImages.string.length,
      outer: false,
      autoplay: true,
      pagination: new SwiperPagination(
          builder: OvalSwiperPaginationBuilder(
              color: Color(0xffE1DEDE),
              activeColor: of.accentColor,
              activeSize: 20.0)),
    ),
  );
}
