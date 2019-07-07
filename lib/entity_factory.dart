import 'package:chongmeng/network/outermost_entity.dart';
import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:chongmeng/function/auto/model/login_entity.dart';
import 'package:chongmeng/function/pet/selecttype/model/pet_type_entity.dart';
import 'package:chongmeng/function/pet/selectsubtype/model/pet_sub_type_entity.dart';
import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:chongmeng/helper/model/auto_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "OutermostEntity") {
      return OutermostEntity.fromJson(json) as T;
    } else if (T.toString() == "CosEntity") {
      return CosEntity.fromJson(json) as T;
    } else if (T.toString() == "LoginEntity") {
      return LoginEntity.fromJson(json) as T;
    } else if (T.toString() == "PetTypeEntity") {
      return PetTypeEntity.fromJson(json) as T;
    } else if (T.toString() == "PetSubTypeEntity") {
      return PetSubTypeEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeEntity") {
      return HomeEntity.fromJson(json) as T;
    } else if (T.toString() == "DynamicListEntity") {
      return DynamicListEntity.fromJson(json) as T;
    } else if (T.toString() == "AutoEntity") {
      return AutoEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}