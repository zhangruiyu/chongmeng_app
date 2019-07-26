class AliProductItem {
  String zkFinalPrice;
  int numIid;
  String pictUrl;
  String title;
  int type;
  String zkFinalPriceWap;
  String eventEndTime;
  String nick;
  int volume;
  String tkRate;
  String couponClickUrl;
  int userType;
  String provcity;
  String itemUrl;
  String shopTitle;
  AliProductItemSmallImages smallImages;
  String eventStartTime;
  String clickUrl;
  String reservePrice;
  int sellerId;
  int status;

  AliProductItem(
      {this.zkFinalPrice,
      this.numIid,
      this.pictUrl,
      this.title,
      this.type,
      this.zkFinalPriceWap,
      this.eventEndTime,
      this.nick,
      this.volume,
      this.tkRate,
      this.couponClickUrl,
      this.userType,
      this.provcity,
      this.itemUrl,
      this.shopTitle,
      this.smallImages,
      this.eventStartTime,
      this.clickUrl,
      this.reservePrice,
      this.sellerId,
      this.status});

  AliProductItem.fromJson(Map<String, dynamic> json) {
    zkFinalPrice = json['zk_final_price'];
    numIid = json['num_iid'];
    pictUrl = json['pict_url'];
    title = json['title'];
    type = json['type'];
    zkFinalPriceWap = json['zk_final_price_wap'];
    eventEndTime = json['event_end_time'];
    nick = json['nick'];
    volume = json['volume'];
    tkRate = json['tk_rate'];
    couponClickUrl = json['coupon_click_url'];
    userType = json['user_type'];
    provcity = json['provcity'];
    itemUrl = json['item_url'];
    shopTitle = json['shop_title'];
    smallImages = json['small_images'] != null
        ? new AliProductItemSmallImages.fromJson(json['small_images'])
        : null;
    eventStartTime = json['event_start_time'];
    clickUrl = json['click_url'];
    reservePrice = json['reserve_price'];
    sellerId = json['seller_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zk_final_price'] = this.zkFinalPrice;
    data['num_iid'] = this.numIid;
    data['pict_url'] = this.pictUrl;
    data['title'] = this.title;
    data['type'] = this.type;
    data['zk_final_price_wap'] = this.zkFinalPriceWap;
    data['event_end_time'] = this.eventEndTime;
    data['nick'] = this.nick;
    data['volume'] = this.volume;
    data['tk_rate'] = this.tkRate;
    data['coupon_click_url'] = this.couponClickUrl;
    data['user_type'] = this.userType;
    data['provcity'] = this.provcity;
    data['item_url'] = this.itemUrl;
    data['shop_title'] = this.shopTitle;
    if (this.smallImages != null) {
      data['small_images'] = this.smallImages.toJson();
    }
    data['event_start_time'] = this.eventStartTime;
    data['click_url'] = this.clickUrl;
    data['reserve_price'] = this.reservePrice;
    data['seller_id'] = this.sellerId;
    data['status'] = this.status;
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
