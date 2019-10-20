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
  String sourceType;
  List<String> pic;
  String remake;
  String externalRemake;
  String type;
  String addressDetail;
  List<MyOrderDataVirtualProduct> virtualProduct;
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
      this.sourceType,
      this.pic,
      this.remake,
      this.type,
      this.addressDetail,
      this.virtualProduct,
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
    sourceType = json['source_type'];
    pic = json['pic']?.cast<String>();
    remake = json['remake'];
    type = json['type'];
    addressDetail = json['address_detail'];
    if (json['virtual_product'] != null) {
      virtualProduct = new List<MyOrderDataVirtualProduct>();
      (json['virtual_product'] as List).forEach((v) {
        virtualProduct.add(new MyOrderDataVirtualProduct.fromJson(v));
      });
    }
    provincename = json['provincename'];
    integral = json['integral'];
    name = json['name'];
    tel = json['tel'];
    id = json['id'];
    status = json['status'];
    externalRemake = json['external_remake'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create_time'] = this.createTime;
    data['areaname'] = this.areaname;
    data['consignee_name'] = this.consigneeName;
    data['cityname'] = this.cityname;
    data['count'] = this.count;
    data['source_type'] = this.sourceType;
    data['pic'] = this.pic;
    data['remake'] = this.remake;
    data['type'] = this.type;
    data['address_detail'] = this.addressDetail;
    if (this.virtualProduct != null) {
      data['virtual_product'] =
          this.virtualProduct.map((v) => v.toJson()).toList();
    }
    data['provincename'] = this.provincename;
    data['integral'] = this.integral;
    data['name'] = this.name;
    data['tel'] = this.tel;
    data['id'] = this.id;
    data['status'] = this.status;
    data['external_remake'] = this.externalRemake;
    return data;
  }
}

class MyOrderDataVirtualProduct {
  String invalidTime;
  String virtualProductRepertoryStatus;
  String content;
  String convertTime;

  MyOrderDataVirtualProduct(
      {this.invalidTime,
      this.virtualProductRepertoryStatus,
      this.content,
      this.convertTime});

  MyOrderDataVirtualProduct.fromJson(Map<String, dynamic> json) {
    invalidTime = json['invalid_time'];
    virtualProductRepertoryStatus = json['virtual_product_repertory_status'];
    content = json['content'];
    convertTime = json['convert_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invalid_time'] = this.invalidTime;
    data['virtual_product_repertory_status'] =
        this.virtualProductRepertoryStatus;
    data['content'] = this.content;
    data['convert_time'] = this.convertTime;
    return data;
  }
}
