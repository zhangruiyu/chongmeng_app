import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class AdoptionAddState implements Cloneable<AdoptionAddState> {
  List<UploadTask> selectPicList;

  //宠物大类型id
  int petTypeId;
  //宠物子类型子
  int petSubTypeId;
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

  //城市
  Result city;
  TextEditingController cityTextEditingController;

  //0 无偿 1 押金 2有偿
  int adoptionType;

  //押金
  TextEditingController cashPledgeTextEditingController;

  //押金退还期限
  TextEditingController cashPledgeDeadlineTextEditingController;

  //有偿
  TextEditingController moneyPledgeTextEditingController;

  @override
  AdoptionAddState clone() {
    return AdoptionAddState()
      ..petSubTypeId = petSubTypeId
      ..adoptionType = adoptionType
      ..selectPicList = selectPicList
      ..petTypeId = petTypeId
      ..sex = sex
      ..isExpellingParasite = isExpellingParasite
      ..isSterilization = isSterilization
      ..isImmune = isImmune
      ..city = city
      ..cashPledgeDeadlineTextEditingController =
          cashPledgeDeadlineTextEditingController
      ..moneyPledgeTextEditingController = moneyPledgeTextEditingController
      ..cashPledgeTextEditingController = cashPledgeTextEditingController
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
      ..cityTextEditingController = cityTextEditingController
      ..descriptionTextEditingController = descriptionTextEditingController;
  }
}

AdoptionAddState initState(Map<String, dynamic> args) {
  return AdoptionAddState()
    ..adoptionType = 0
    ..cashPledgeDeadlineTextEditingController = TextEditingController()
    ..moneyPledgeTextEditingController = TextEditingController()
    ..cashPledgeTextEditingController = TextEditingController()
    ..isExpellingParasiteTextEditingController = TextEditingController()
    ..isSterilizationTextEditingController = TextEditingController()
    ..isImmuneTextEditingController = TextEditingController()
    ..petTypeIdTextEditingController = TextEditingController()
    ..petNameTextEditingController = TextEditingController()
    ..sexTextEditingController = TextEditingController()
    ..ageTextEditingController = TextEditingController()
    ..requestTextEditingController = TextEditingController()
    ..masterNameTextEditingController = TextEditingController()
    ..cityTextEditingController = TextEditingController()
    ..descriptionTextEditingController = TextEditingController();
}
