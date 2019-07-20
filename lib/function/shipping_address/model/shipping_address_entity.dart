class ShippingAddressEntity {
  String msg;
  List<ShippingAddressData> data;
  int status;

  ShippingAddressEntity({this.msg, this.data, this.status});

  ShippingAddressEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<ShippingAddressData>();
      (json['data'] as List).forEach((v) {
        data.add(new ShippingAddressData.fromJson(v));
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

class ShippingAddressData {
  String address;
  String consignee;
  String createTime;
  String tel;
  String areaText;
  ShippingAddressDataCitydata cityData;

  ShippingAddressData(
      {this.address,
      this.consignee,
      this.createTime,
      this.tel,
      this.areaText,
      this.cityData});

  ShippingAddressData.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    consignee = json['consignee'];
    createTime = json['createTime'];
    tel = json['tel'];
    areaText = json['areaText'];
    cityData = json['cityData'] != null
        ? new ShippingAddressDataCitydata.fromJson(json['cityData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['consignee'] = this.consignee;
    data['createTime'] = this.createTime;
    data['tel'] = this.tel;
    data['areaText'] = this.areaText;
    if (this.cityData != null) {
      data['cityData'] = this.cityData.toJson();
    }
    return data;
  }
}

class ShippingAddressDataCitydata {
  String areaId;
  String cityName;
  String areaName;
  String cityId;
  String provinceName;
  String provinceId;

  ShippingAddressDataCitydata(
      {this.areaId,
      this.cityName,
      this.areaName,
      this.cityId,
      this.provinceName,
      this.provinceId});

  ShippingAddressDataCitydata.fromJson(Map<String, dynamic> json) {
    areaId = json['areaId'];
    cityName = json['cityName'];
    areaName = json['areaName'];
    cityId = json['cityId'];
    provinceName = json['provinceName'];
    provinceId = json['provinceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['areaId'] = this.areaId;
    data['cityName'] = this.cityName;
    data['areaName'] = this.areaName;
    data['cityId'] = this.cityId;
    data['provinceName'] = this.provinceName;
    data['provinceId'] = this.provinceId;
    return data;
  }
}
