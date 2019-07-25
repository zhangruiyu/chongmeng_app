class HomeEntity {
  String msg;
  HomeData data;
  int status;

  HomeEntity({this.msg, this.data, this.status});

  HomeEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new HomeData.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class HomeData {
  List<HomeDataTab> tab;
  List<String> recommendProduct;
  List<HomeDataBanner> banner;
  List<String> sysNotices;

  HomeData({this.tab, this.recommendProduct, this.banner, this.sysNotices});

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['tab'] != null) {
      tab = new List<HomeDataTab>();
      (json['tab'] as List).forEach((v) {
        tab.add(new HomeDataTab.fromJson(v));
      });
    }
    recommendProduct = json['recommendProduct']?.cast<String>();
    if (json['banner'] != null) {
      banner = new List<HomeDataBanner>();
      (json['banner'] as List).forEach((v) {
        banner.add(new HomeDataBanner.fromJson(v));
      });
    }
    sysNotices = json['sysNotices']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tab != null) {
      data['tab'] = this.tab.map((v) => v.toJson()).toList();
    }
    data['recommendProduct'] = this.recommendProduct;
    if (this.banner != null) {
      data['banner'] = this.banner.map((v) => v.toJson()).toList();
    }
    data['sysNotices'] = this.sysNotices;
    return data;
  }
}

class HomeDataTab {
  bool isH5;
  String imageUrl;
  String title;
  dynamic skipUrl;

  HomeDataTab({this.isH5, this.imageUrl, this.title, this.skipUrl});

  HomeDataTab.fromJson(Map<String, dynamic> json) {
    isH5 = json['isH5'];
    imageUrl = json['imageUrl'];
    title = json['title'];
    skipUrl = json['skipUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isH5'] = this.isH5;
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    data['skipUrl'] = this.skipUrl;
    return data;
  }
}

class HomeDataBanner {
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
  int userType;
  String provcity;
  String itemUrl;
  String shopTitle;
  HomeDataBannerSmallImages smallImages;
  String eventStartTime;
  String reservePrice;
  int sellerId;
  int status;
  String clickUrl;

  HomeDataBanner(
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
      this.userType,
      this.provcity,
      this.itemUrl,
      this.shopTitle,
      this.smallImages,
      this.eventStartTime,
      this.reservePrice,
      this.sellerId,
      this.status});

  HomeDataBanner.fromJson(Map<String, dynamic> json) {
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
    userType = json['user_type'];
    provcity = json['provcity'];
    itemUrl = json['item_url'];
    shopTitle = json['shop_title'];
    smallImages = json['small_images'] != null
        ? new HomeDataBannerSmallImages.fromJson(json['small_images'])
        : null;
    eventStartTime = json['event_start_time'];
    reservePrice = json['reserve_price'];
    sellerId = json['seller_id'];
    status = json['status'];
    clickUrl = json['click_url'];
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
    data['user_type'] = this.userType;
    data['provcity'] = this.provcity;
    data['item_url'] = this.itemUrl;
    data['shop_title'] = this.shopTitle;
    if (this.smallImages != null) {
      data['small_images'] = this.smallImages.toJson();
    }
    data['event_start_time'] = this.eventStartTime;
    data['reserve_price'] = this.reservePrice;
    data['seller_id'] = this.sellerId;
    data['status'] = this.status;
    return data;
  }
}

class HomeDataBannerSmallImages {
  List<String> string;

  HomeDataBannerSmallImages({this.string});

  HomeDataBannerSmallImages.fromJson(Map<String, dynamic> json) {
    string = json['string']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['string'] = this.string;
    return data;
  }
}
