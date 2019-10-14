import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'model/coupon_entity.dart';

class CouponDetailState implements Cloneable<CouponDetailState> {
  TextEditingController telEditingController;
  TextEditingController codeEditingController;
  IntegralCommodityDataElemo itemData;
  List<CouponData> data;
  int position;
  String positionType;
  CouponDetailPageStatus pageStatus;

  @override
  CouponDetailState clone() {
    return CouponDetailState()
      ..telEditingController = telEditingController
      ..itemData = itemData
      ..position = position
      ..positionType = positionType
      ..pageStatus = pageStatus;
  }
}

CouponDetailState initState(Map<String, dynamic> args) {
  return CouponDetailState()
    ..telEditingController = TextEditingController(
        text: GlobalStore.store.getState().sp.getString('couponTel'))
    ..codeEditingController = TextEditingController()
    ..itemData = args['itemData']
    ..position = args['position']
    ..pageStatus = CouponDetailPageStatus.NORMAL;
}

enum CouponDetailPageStatus {
  NORMAL,
}
