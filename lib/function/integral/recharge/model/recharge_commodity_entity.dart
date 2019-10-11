class RechargeCommodityEntity {
  String msg;
  List<RechargeCommodityData> data;
  int status;

  RechargeCommodityEntity({this.msg, this.data, this.status});

  RechargeCommodityEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<RechargeCommodityData>();
      (json['data'] as List).forEach((v) {
        data.add(new RechargeCommodityData.fromJson(v));
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

class RechargeCommodityData {
  int give;
  int original;
  int money;
  String showMoney;
  String createTime;
  int id;

  RechargeCommodityData(
      {this.give, this.original, this.money, this.createTime, this.id});

  RechargeCommodityData.fromJson(Map<String, dynamic> json) {
    give = json['give'];
    original = json['original'];
    money = json['money'];
    createTime = json['create_time'];
    id = json['id'];
    showMoney = json['showMoney'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['give'] = this.give;
    data['original'] = this.original;
    data['money'] = this.money;
    data['create_time'] = this.createTime;
    data['id'] = this.id;
    data['showMoney'] = this.showMoney;
    return data;
  }
}
