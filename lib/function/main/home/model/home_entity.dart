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
  List<HomeDataBanner> banners;
  List<HomeDataContent> content;

  HomeData({this.tab, this.banners, this.content});

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['tab'] != null) {
      tab = new List<HomeDataTab>();
      (json['tab'] as List).forEach((v) {
        tab.add(new HomeDataTab.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = new List<HomeDataBanner>();
      (json['banners'] as List).forEach((v) {
        banners.add(new HomeDataBanner.fromJson(v));
      });
    }
    if (json['content'] != null) {
      content = new List<HomeDataContent>();
      (json['content'] as List).forEach((v) {
        content.add(new HomeDataContent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tab != null) {
      data['tab'] = this.tab.map((v) => v.toJson()).toList();
    }
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    if (this.content != null) {
      data['content'] = this.content.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeDataTab {
  String picUrl;
  String title;
  String url;

  HomeDataTab({this.picUrl, this.title, this.url});

  HomeDataTab.fromJson(Map<String, dynamic> json) {
    picUrl = json['picUrl'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['picUrl'] = this.picUrl;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}

class HomeDataBanner {
  String createTime;
  int bannerId;
  String imgUrl;
  int canShare;
  String title;
  String url;

  HomeDataBanner(
      {this.createTime,
      this.bannerId,
      this.imgUrl,
      this.canShare,
      this.title,
      this.url});

  HomeDataBanner.fromJson(Map<String, dynamic> json) {
    createTime = json['create_time'];
    bannerId = json['banner_id'];
    imgUrl = json['img_url'];
    canShare = json['can_share'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create_time'] = this.createTime;
    data['banner_id'] = this.bannerId;
    data['img_url'] = this.imgUrl;
    data['can_share'] = this.canShare;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}

class HomeDataContent {
  String picUrl;
  String title;
  String url;

  HomeDataContent({this.picUrl, this.title, this.url});

  HomeDataContent.fromJson(Map<String, dynamic> json) {
    picUrl = json['picUrl'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['picUrl'] = this.picUrl;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}
