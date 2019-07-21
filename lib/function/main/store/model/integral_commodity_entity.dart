class IntegralCommodityEntity {
  String msg;
  List<IntegralCommodityData> data;
  int status;

  IntegralCommodityEntity({this.msg, this.data, this.status});

  IntegralCommodityEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<IntegralCommodityData>();
      (json['data'] as List).forEach((v) {
        data.add(new IntegralCommodityData.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class IntegralCommodityData {
  int integralPrice;
  String createTime;
  String name;
  int count;
  String details;
  int id;
  List<String> pic;

  IntegralCommodityData(
      {this.integralPrice,
      this.createTime,
      this.name,
      this.count,
      this.details,
      this.id,
      this.pic});

  IntegralCommodityData.fromJson(Map<String, dynamic> json) {
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
