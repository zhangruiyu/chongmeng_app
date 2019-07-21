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
  String address;
  String createTime;
  int integral;
  String nickName;
  int count;
  String name;
  String tel;
  int id;
  List<String> pic;
  String remake;
  int status;

  MyOrderData(
      {this.address,
      this.createTime,
      this.integral,
      this.nickName,
      this.count,
      this.name,
      this.tel,
      this.id,
      this.pic,
      this.remake,
      this.status});

  MyOrderData.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    createTime = json['create_time'];
    integral = json['integral'];
    nickName = json['nick_name'];
    count = json['count'];
    name = json['name'];
    tel = json['tel'];
    id = json['id'];
    pic = json['pic']?.cast<String>();
    remake = json['remake'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['create_time'] = this.createTime;
    data['integral'] = this.integral;
    data['nick_name'] = this.nickName;
    data['count'] = this.count;
    data['name'] = this.name;
    data['tel'] = this.tel;
    data['id'] = this.id;
    data['pic'] = this.pic;
    data['remake'] = this.remake;
    data['status'] = this.status;
    return data;
  }
}
