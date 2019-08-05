class AdoptionEntity {
  String msg;
  List<AdoptionData> data;
  int status;

  AdoptionEntity({this.msg, this.data, this.status});

  AdoptionEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<AdoptionData>();
      (json['data'] as List).forEach((v) {
        data.add(new AdoptionData.fromJson(v));
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

class AdoptionData {
  int petTypeId;
  String request;
  String masterWechat;
  String createTime;
  int sex;
  String description;
  bool isSterilization;
  String masterCityShow;
  List<String> pic;
  String petTypeName;
  String masterName;
  bool isImmune;
  String petName;
  String masterCityCode;
  int userId;
  dynamic subTypeId;
  bool isExpellingParasite;
  int id;
  String age;
  int status;

  AdoptionData(
      {this.petTypeId,
      this.request,
      this.masterWechat,
      this.createTime,
      this.sex,
      this.description,
      this.isSterilization,
      this.masterCityShow,
      this.pic,
      this.petTypeName,
      this.masterName,
      this.isImmune,
      this.petName,
      this.masterCityCode,
      this.userId,
      this.subTypeId,
      this.isExpellingParasite,
      this.id,
      this.age,
      this.status});

  AdoptionData.fromJson(Map<String, dynamic> json) {
    petTypeId = json['pet_type_id'];
    request = json['request'];
    masterWechat = json['master_wechat'];
    createTime = json['create_time'];
    sex = json['sex'];
    description = json['description'];
    isSterilization = json['is_sterilization'];
    masterCityShow = json['master_city_show'];
    pic = json['pic']?.cast<String>();
    petTypeName = json['pet_type_name'];
    masterName = json['master_name'];
    isImmune = json['is_immune'];
    petName = json['pet_name'];
    masterCityCode = json['master_city_code'];
    userId = json['user_id'];
    subTypeId = json['sub_type_id'];
    isExpellingParasite = json['is_expelling_parasite'];
    id = json['id'];
    age = json['age'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pet_type_id'] = this.petTypeId;
    data['request'] = this.request;
    data['master_wechat'] = this.masterWechat;
    data['create_time'] = this.createTime;
    data['sex'] = this.sex;
    data['description'] = this.description;
    data['is_sterilization'] = this.isSterilization;
    data['master_city_show'] = this.masterCityShow;
    data['pic'] = this.pic;
    data['pet_type_name'] = this.petTypeName;
    data['master_name'] = this.masterName;
    data['is_immune'] = this.isImmune;
    data['pet_name'] = this.petName;
    data['master_city_code'] = this.masterCityCode;
    data['user_id'] = this.userId;
    data['sub_type_id'] = this.subTypeId;
    data['is_expelling_parasite'] = this.isExpellingParasite;
    data['id'] = this.id;
    data['age'] = this.age;
    data['status'] = this.status;
    return data;
  }
}
