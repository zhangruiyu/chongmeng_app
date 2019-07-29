class AliProductItem {
  int volume;
  String couponClickUrl;
  AliProductItemSmallImages smallImages;
  String pictUrl;
  String title;
  double zkFinalPriceWap;
  double favourablePrice;
  String couponValue;
  String couponStartTime;
  String couponEndTime;

  AliProductItem(
      {this.volume,
      this.couponClickUrl,
      this.smallImages,
      this.pictUrl,
      this.title,
      this.zkFinalPriceWap,
      this.favourablePrice,
      this.couponValue});

  AliProductItem.fromJson(Map<String, dynamic> json) {
    volume = json['volume'];
    couponClickUrl = json['coupon_click_url'];
    smallImages = json['small_images'] != null
        ? new AliProductItemSmallImages.fromJson(json['small_images'])
        : null;
    pictUrl = json['pict_url'];
    title = json['title'];
    zkFinalPriceWap = json['zk_final_price_wap'];
    favourablePrice = json['favourable_price'];
    couponValue = json['coupon_value'];
    couponStartTime = json['coupon_start_time'];
    couponEndTime = json['coupon_end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['volume'] = this.volume;
    data['coupon_click_url'] = this.couponClickUrl;
    if (this.smallImages != null) {
      data['small_images'] = this.smallImages.toJson();
    }
    data['pict_url'] = this.pictUrl;
    data['title'] = this.title;
    data['zk_final_price_wap'] = this.zkFinalPriceWap;
    data['favourable_price'] = this.favourablePrice;
    data['coupon_value'] = this.couponValue;
    data['coupon_start_time'] = this.couponStartTime;
    data['coupon_end_time'] = this.couponEndTime;
    return data;
  }
}

class AliProductItemSmallImages {
  List<String> string;

  AliProductItemSmallImages({this.string});

  AliProductItemSmallImages.fromJson(Map<String, dynamic> json) {
    string = json['string']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['string'] = this.string;
    return data;
  }
}
