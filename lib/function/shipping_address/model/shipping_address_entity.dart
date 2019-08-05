class ShippingAddressEntity {
  String msg;
  ShippingAddressData data;
  int status;

  ShippingAddressEntity({this.msg, this.data, this.status});

  ShippingAddressEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null
        ? new ShippingAddressData.fromJson(json['data'])
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

class ShippingAddressData {
  List<ShippingAddressDataShopAddres> shopAddress;

  ShippingAddressData({this.shopAddress});

  ShippingAddressData.fromJson(Map<String, dynamic> json) {
    if (json['shop_address'] != null) {
      shopAddress = new List<ShippingAddressDataShopAddres>();
      (json['shop_address'] as List).forEach((v) {
        shopAddress.add(new ShippingAddressDataShopAddres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shopAddress != null) {
      data['shop_address'] = this.shopAddress.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShippingAddressDataShopAddres {
  String address;
  String consignee;
  String createTime;
  String tel;
  String areaText;
  String id;
  ShippingAddressDataShopAddressCitydata cityData;

  ShippingAddressDataShopAddres(
      {this.address,
      this.consignee,
      this.createTime,
      this.tel,
      this.areaText,
      this.id,
      this.cityData});

  ShippingAddressDataShopAddres.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    consignee = json['consignee'];
    createTime = json['createTime'];
    tel = json['tel'];
    areaText = json['areaText'];
    id = json['id'];
    cityData = json['cityData'] != null
        ? new ShippingAddressDataShopAddressCitydata.fromJson(json['cityData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['consignee'] = this.consignee;
    data['createTime'] = this.createTime;
    data['tel'] = this.tel;
    data['areaText'] = this.areaText;
    data['id'] = this.id;
    if (this.cityData != null) {
      data['cityData'] = this.cityData.toJson();
    }
    return data;
  }
}

class ShippingAddressDataShopAddressCitydata {
  String areaId;
  String cityName;
  String areaName;
  String cityId;
  String provinceName;
  String provinceId;

  ShippingAddressDataShopAddressCitydata(
      {this.areaId,
      this.cityName,
      this.areaName,
      this.cityId,
      this.provinceName,
      this.provinceId});

  ShippingAddressDataShopAddressCitydata.fromJson(Map<String, dynamic> json) {
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
