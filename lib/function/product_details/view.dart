import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/dotline_widget.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:chongmeng/widget/oval_swiper_pagination_builder.dart';
import 'package:extended_text/extended_text.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'action.dart';
import 'state.dart';

var tagSource = {
  'taobao': "淘宝",
  'jingdong': "京东",
  'tianmao': "天猫",
};

Widget buildView(
    ProductDetailsState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  var itemData = state.itemData;
  return Scaffold(
      body: Column(
    children: <Widget>[
      Expanded(
        child: EasyRefresh.custom(
          firstRefresh: true,
          firstRefreshWidget: LoadingWidget(),
          /* onRefresh: CompleterUtils.produceCompleterAction(
  dispatch,
  ProductDetailsActionCreator.onRefresh,
    ),*/
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              elevation: 0.0,
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
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExtendedText.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                margin: EdgeInsets.only(right: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  border: Border.all(
                                    color: of.accentColor,
                                    width: 1.0,
                                  ),
                                ),
                                child: Text(
                                  tagSource[state.itemData.type],
                                  style: TextStyle(
                                      color: of.accentColor, fontSize: 12.0),
                                ),
                              ),
                            ),
                            TextSpan(text: itemData.title),
                          ],
                        ),
                      )),
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
                  buildButton(of, itemData),
                  ...buildDetailsWidget(state)
                ],
              ),
            ),
          ],
        ),
      ),
      //底部按钮
      Row(
        children: <Widget>[
          InkResponse(
            onTap: () {
              showToast("下期开放");
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.share,
                    color: color7E7E7E,
                    size: 23.0,
                  ),
                  Text(
                    "分享",
                    style: TextStyle(fontSize: 12.0, color: color7E7E7E),
                  )
                ],
              ),
            ),
          ),
          InkResponse(
            onTap: () {
              showToast("下期开放");
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.star_border,
                    color: color7E7E7E,
                  ),
                  Text(
                    "收藏",
                    style: TextStyle(fontSize: 12.0, color: color7E7E7E),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 18, right: 18),
              height: 40.0,
              decoration: new BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.pink[300], of.accentColor]),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  launch(itemData.couponClickUrl);
                },
                child: Text(
                  "领券购买",
                  style: TextStyle(color: colorWhite),
                ),
              ),
            ),
          )
        ],
      )
    ],
  ));
}

List<Widget> buildDetailsWidget(ProductDetailsState state) {
  if (state.detailsEntity?.data?.isNotEmpty == true) {
    return state.detailsEntity.data
        .map((item) => CachedNetworkImage(
              imageUrl: item,
            ))
        .toList();
  } else {
    return [];
  }
}

Container buildButton(ThemeData of, AliProductItem itemData) {
  return Container(
    margin: const EdgeInsets.only(top: 15.0, left: 18, right: 18, bottom: 30.0),
    height: 70.0,
    decoration: new BoxDecoration(
      gradient: LinearGradient(colors: [Colors.pink[300], of.accentColor]),
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
    ),
    alignment: Alignment.center,
    child: GestureDetector(
      onTap: () {
        launch(itemData.couponClickUrl);
      },
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
                        style: TextStyle(fontSize: 24.0, color: colorWhite)),
                    TextSpan(
                        text: "元优惠券",
                        style: TextStyle(fontSize: 14.0, color: colorWhite)),
                  ],
                ),
              ),
              Text(
                "使用期限: ${itemData.couponStartTime}~${itemData.couponEndTime}",
                style: of.textTheme.caption
                    .merge(TextStyle(color: colord9d9d9, fontSize: 12.0)),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Dotline(
              height: 20.0,
              width: 1.5,
              dashHeight: 4.0,
              color: colorWhite,
            ),
          ),
          Text(
            "立即领券",
            style: TextStyle(color: colorWhite),
          ),
        ],
      ),
    ),
  );
}

SizedBox buildBanner(AliProductItem itemData, ThemeData of) {
  return SizedBox(
    width: WindowUtils.getScreenWidth(),
    height: WindowUtils.getScreenWidth(),
    child: new Swiper(
      itemBuilder: (BuildContext context, int index) {
        String itemBanner = itemData.smallImages[index];
        return new CachedNetworkImage(
          imageUrl: itemBanner,
          fit: BoxFit.fill,
          width: WindowUtils.getScreenWidth(),
          height: WindowUtils.getScreenWidth(),
          errorWidget: (b, c, e) {
            return new Container();
          },
        );
      },
      itemCount: itemData.smallImages.length,
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
