import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'model/coupon_entity.dart';

class CouponDetailState implements Cloneable<CouponDetailState> {
  TextEditingController telEditingController;
  List<CouponData> data;
  @override
  CouponDetailState clone() {
    return CouponDetailState()..telEditingController = telEditingController;
  }
}

CouponDetailState initState(Map<String, dynamic> args) {
  return CouponDetailState()..telEditingController = TextEditingController();
}
