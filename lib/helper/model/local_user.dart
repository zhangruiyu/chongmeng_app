class LocalUser {
  String createTime;
  int userId;
  String nickName;
  int sex;
  String description;
  String tel;
  String token;

  LocalUser(
      {this.createTime,
      this.userId,
      this.nickName,
      this.sex,
      this.description,
      this.tel,
      this.token});

  LocalUser.fromJson(Map<String, dynamic> json) {
    createTime = json['create_time'];
    userId = json['user_id'];
    nickName = json['nick_name'];
    sex = json['sex'];
    description = json['description'];
    tel = json['tel'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create_time'] = this.createTime;
    data['user_id'] = this.userId;
    data['nick_name'] = this.nickName;
    data['sex'] = this.sex;
    data['description'] = this.description;
    data['tel'] = this.tel;
    data['token'] = this.token;
    return data;
  }
}
