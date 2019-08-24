class MyOrderEntity {
  String msg;
  List<MyOrderData> data;
  int status;

  MyOrderEntity({this.msg, this.data, this.status});

  MyOrderEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<MyOrderData>();
      (json['data'] as List).forEach((v) {
        data.add(new MyOrderData.fromJson(v));
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

class MyOrderData {
  String createTime;
  String areaname;
  String consigneeName;
  String cityname;
  int count;
  List<String> pic;
  String remake;
  String addressDetail;
  String provincename;
  int integral;
  String name;
  String tel;
  int id;
  int status;

  MyOrderData(
      {this.createTime,
      this.areaname,
      this.consigneeName,
      this.cityname,
      this.count,
      this.pic,
      this.remake,
      this.addressDetail,
      this.provincename,
      this.integral,
      this.name,
      this.tel,
      this.id,
      this.status});

  MyOrderData.fromJson(Map<String, dynamic> json) {
    createTime = json['create_time'];
    areaname = json['areaname'];
    consigneeName = json['consignee_name'];
    cityname = json['cityname'];
    count = json['count'];
    pic = json['pic']?.cast<String>();
    remake = json['remake'];
    addressDetail = json['address_detail'];
    provincename = json['provincename'];
    integral = json['integral'];
    name = json['name'];
    tel = json['tel'];
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create_time'] = this.createTime;
    data['areaname'] = this.areaname;
    data['consignee_name'] = this.consigneeName;
    data['cityname'] = this.cityname;
    data['count'] = this.count;
    data['pic'] = this.pic;
    data['remake'] = this.remake;
    data['address_detail'] = this.addressDetail;
    data['provincename'] = this.provincename;
    data['integral'] = this.integral;
    data['name'] = this.name;
    data['tel'] = this.tel;
    data['id'] = this.id;
    data['status'] = this.status;
    return data;
  }
}
