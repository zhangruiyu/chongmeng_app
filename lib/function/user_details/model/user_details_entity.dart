class UserDetailsEntity {
  String msg;
  UserDetailsData data;
  int status;

  UserDetailsEntity({this.msg, this.data, this.status});

  UserDetailsEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null
        ? new UserDetailsData.fromJson(json['data'])
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

class UserDetailsData {
  String areaname;
  int sex;
  String cityname;
  String description;
  String avatar;
  int cityid;
  int provinceid;
  int areaid;
  int userId;
  bool hasPet;
  String provincename;
  String nickName;
  String tel;

  UserDetailsData(
      {this.areaname,
      this.sex,
      this.cityname,
      this.description,
      this.avatar,
      this.cityid,
      this.provinceid,
      this.areaid,
      this.userId,
      this.hasPet,
      this.provincename,
      this.nickName,
      this.tel});

  UserDetailsData.fromJson(Map<String, dynamic> json) {
    areaname = json['areaname'];
    sex = json['sex'];
    cityname = json['cityname'];
    description = json['description'];
    avatar = json['avatar'];
    cityid = json['cityid'];
    provinceid = json['provinceid'];
    areaid = json['areaid'];
    userId = json['user_id'];
    hasPet = json['has_pet'];
    provincename = json['provincename'];
    nickName = json['nick_name'];
    tel = json['tel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['areaname'] = this.areaname;
    data['sex'] = this.sex;
    data['cityname'] = this.cityname;
    data['description'] = this.description;
    data['avatar'] = this.avatar;
    data['cityid'] = this.cityid;
    data['provinceid'] = this.provinceid;
    data['areaid'] = this.areaid;
    data['user_id'] = this.userId;
    data['has_pet'] = this.hasPet;
    data['provincename'] = this.provincename;
    data['nick_name'] = this.nickName;
    data['tel'] = this.tel;
    return data;
  }
}
