class DynamicListEntity {
  String msg;
  List<DynamicListData> data;
  int status;

  DynamicListEntity({this.msg, this.data, this.status});

  DynamicListEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<DynamicListData>();
      (json['data'] as List).forEach((v) {
        data.add(new DynamicListData.fromJson(v));
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

class DynamicListData {
  List<DynamicListDataPet> pets;
  List<String> images;
  String createTime;
  int userId;
  String nickName;
  int sex;
  String description;
  int id;
  DynamicListDataVideo video;
  String avatar;
  String content;
  List<Null> liked;

  DynamicListData(
      {this.pets,
      this.images,
      this.createTime,
      this.userId,
      this.nickName,
      this.sex,
      this.description,
      this.id,
      this.video,
      this.avatar,
      this.content,
      this.liked});

  DynamicListData.fromJson(Map<String, dynamic> json) {
    if (json['pets'] != null) {
      pets = new List<DynamicListDataPet>();
      (json['pets'] as List).forEach((v) {
        pets.add(new DynamicListDataPet.fromJson(v));
      });
    }
    images = json['images']?.cast<String>();
    createTime = json['create_time'];
    userId = json['user_id'];
    nickName = json['nick_name'];
    sex = json['sex'];
    description = json['description'];
    id = json['id'];
    video = json['video'] != null
        ? new DynamicListDataVideo.fromJson(json['video'])
        : null;
    avatar = json['avatar'];
    content = json['content'];
    if (json['liked'] != null) {
      liked = new List<Null>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pets != null) {
      data['pets'] = this.pets.map((v) => v.toJson()).toList();
    }
    data['images'] = this.images;
    data['create_time'] = this.createTime;
    data['user_id'] = this.userId;
    data['nick_name'] = this.nickName;
    data['sex'] = this.sex;
    data['description'] = this.description;
    data['id'] = this.id;
    if (this.video != null) {
      data['video'] = this.video.toJson();
    }
    data['avatar'] = this.avatar;
    data['content'] = this.content;
    if (this.liked != null) {
      data['liked'] = [];
    }
    return data;
  }
}

class DynamicListDataPet {
  String nick;
  String birthday;
  int sex;
  int petTypeId;
  String avatar;
  int petSubTypeId;
  int status;

  DynamicListDataPet(
      {this.nick,
      this.birthday,
      this.sex,
      this.petTypeId,
      this.avatar,
      this.petSubTypeId,
      this.status});

  DynamicListDataPet.fromJson(Map<String, dynamic> json) {
    nick = json['nick'];
    birthday = json['birthday'];
    sex = json['sex'];
    petTypeId = json['petTypeId'];
    avatar = json['avatar'];
    petSubTypeId = json['petSubTypeId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nick'] = this.nick;
    data['birthday'] = this.birthday;
    data['sex'] = this.sex;
    data['petTypeId'] = this.petTypeId;
    data['avatar'] = this.avatar;
    data['petSubTypeId'] = this.petSubTypeId;
    data['status'] = this.status;
    return data;
  }
}

class DynamicListDataVideo {
  String videoPath;
  String videoThumbnailPath;

  DynamicListDataVideo({this.videoPath, this.videoThumbnailPath});

  DynamicListDataVideo.fromJson(Map<String, dynamic> json) {
    videoPath = json['videoPath'];
    videoThumbnailPath = json['videoThumbnailPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videoPath'] = this.videoPath;
    data['videoThumbnailPath'] = this.videoThumbnailPath;
    return data;
  }
}
