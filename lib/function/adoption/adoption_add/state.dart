import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class AdoptionAddState implements Cloneable<AdoptionAddState> {
  List<UploadTask> selectPicList;

  //宠物类型id
  int petTypeId;
  TextEditingController petTypeIdTextEditingController;

  //性别
  int sex;
  TextEditingController sexTextEditingController;

  //是否驱虫
  int isExpellingParasite;
  TextEditingController isExpellingParasiteTextEditingController;

//是否绝育
  int isSterilization;
  TextEditingController isSterilizationTextEditingController;

//是否免疫疫苗
  int isImmune;
  TextEditingController isImmuneTextEditingController;

  //宠物名字
  TextEditingController petNameTextEditingController;

  //描述
  TextEditingController descriptionTextEditingController;

  //年龄
  TextEditingController ageTextEditingController;

  //领养要求
  TextEditingController requestTextEditingController;

  //送养人名字
  TextEditingController masterNameTextEditingController;

  //送养人微信
  TextEditingController masterWechatTextEditingController;

  //城市
  String cityCode;
  TextEditingController cityTextEditingController;

  @override
  AdoptionAddState clone() {
    return AdoptionAddState()
      ..selectPicList = selectPicList
      ..petTypeId = petTypeId
      ..sex = sex
      ..isExpellingParasite = isExpellingParasite
      ..isSterilization = isSterilization
      ..isImmune = isImmune
      ..cityCode = cityCode
      ..petTypeIdTextEditingController = petTypeIdTextEditingController
      ..sexTextEditingController = sexTextEditingController
      ..ageTextEditingController = ageTextEditingController
      ..isExpellingParasiteTextEditingController =
          isExpellingParasiteTextEditingController
      ..isSterilizationTextEditingController =
          isSterilizationTextEditingController
      ..isImmuneTextEditingController = isImmuneTextEditingController
      ..petNameTextEditingController = petNameTextEditingController
      ..requestTextEditingController = requestTextEditingController
      ..masterNameTextEditingController = masterNameTextEditingController
      ..masterWechatTextEditingController = masterWechatTextEditingController
      ..cityTextEditingController = cityTextEditingController
      ..descriptionTextEditingController = descriptionTextEditingController;
  }
}

AdoptionAddState initState(Map<String, dynamic> args) {
  return AdoptionAddState()
    ..isExpellingParasiteTextEditingController = TextEditingController()
    ..isSterilizationTextEditingController = TextEditingController()
    ..isImmuneTextEditingController = TextEditingController()
    ..petTypeIdTextEditingController = TextEditingController()
    ..petNameTextEditingController = TextEditingController()
    ..sexTextEditingController = TextEditingController()
    ..ageTextEditingController = TextEditingController()
    ..requestTextEditingController = TextEditingController()
    ..masterNameTextEditingController = TextEditingController()
    ..masterWechatTextEditingController = TextEditingController()
    ..cityTextEditingController = TextEditingController()
    ..descriptionTextEditingController = TextEditingController();
}
