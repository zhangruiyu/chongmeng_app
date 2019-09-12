class IntegralCommodityEntity {
  String msg;
  IntegralCommodityData data;
  int status;

  IntegralCommodityEntity({this.msg, this.data, this.status});

  IntegralCommodityEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null
        ? new IntegralCommodityData.fromJson(json['data'])
        : null;
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

class IntegralCommodityData {
  List<IntegralCommodityDataElemo> elemo;
  List<IntegralCommodityDataIntegralcommodity> integralCommodity;
  List<String> sysNotices;

  IntegralCommodityData({this.elemo, this.integralCommodity, this.sysNotices});

  IntegralCommodityData.fromJson(Map<String, dynamic> json) {
    if (json['elemo'] != null) {
      elemo = new List<IntegralCommodityDataElemo>();
      (json['elemo'] as List).forEach((v) {
        elemo.add(new IntegralCommodityDataElemo.fromJson(v));
      });
    }
    if (json['integralCommodity'] != null) {
      integralCommodity = new List<IntegralCommodityDataIntegralcommodity>();
      (json['integralCommodity'] as List).forEach((v) {
        integralCommodity
            .add(new IntegralCommodityDataIntegralcommodity.fromJson(v));
      });
    }
    sysNotices = json['sysNotices']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.elemo != null) {
      data['elemo'] = this.elemo.map((v) => v.toJson()).toList();
    }
    if (this.integralCommodity != null) {
      data['integralCommodity'] =
          this.integralCommodity.map((v) => v.toJson()).toList();
    }
    data['sysNotices'] = this.sysNotices;
    return data;
  }
}

class IntegralCommodityDataElemo {
  int integralPrice;
  int count;
  String pic;
  String title;
  String type;

  IntegralCommodityDataElemo(
      {this.integralPrice, this.count, this.pic, this.title, this.type});

  IntegralCommodityDataElemo.fromJson(Map<String, dynamic> json) {
    integralPrice = json['integral_price'];
    count = json['count'];
    pic = json['pic'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['integral_price'] = this.integralPrice;
    data['count'] = this.count;
    data['pic'] = this.pic;
    data['title'] = this.title;
    data['type'] = this.type;
    return data;
  }
}

class IntegralCommodityDataIntegralcommodity {
  int integralPrice;
  String createTime;
  String name;
  int count;
  String details;
  int id;
  List<String> pic;

  IntegralCommodityDataIntegralcommodity(
      {this.integralPrice,
      this.createTime,
      this.name,
      this.count,
      this.details,
      this.id,
      this.pic});

  IntegralCommodityDataIntegralcommodity.fromJson(Map<String, dynamic> json) {
    integralPrice = json['integral_price'];
    createTime = json['create_time'];
    name = json['name'];
    count = json['count'];
    details = json['details'];
    id = json['id'];
    pic = json['pic']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['integral_price'] = this.integralPrice;
    data['create_time'] = this.createTime;
    data['name'] = this.name;
    data['count'] = this.count;
    data['details'] = this.details;
    data['id'] = this.id;
    data['pic'] = this.pic;
    return data;
  }
}
