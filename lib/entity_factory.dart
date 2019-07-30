import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:chongmeng/function/shipping_address/model/shipping_address_entity.dart';
import 'package:chongmeng/function/auto/model/login_entity.dart';
import 'package:chongmeng/function/recipe/model/recipe_entity.dart';
import 'package:chongmeng/function/my_order/model/my_order_entity.dart';
import 'package:chongmeng/function/search/model/search_result_entity.dart';
import 'package:chongmeng/function/tally/entity/current_user_tally_entity.dart';
import 'package:chongmeng/function/tally/entity/tally_tag_entity.dart';
import 'package:chongmeng/function/signin/model/sign_in_result_entity.dart';
import 'package:chongmeng/function/signin/model/sign_list_entity.dart';
import 'package:chongmeng/function/pet/selecttype/model/pet_type_entity.dart';
import 'package:chongmeng/function/pet/selectsubtype/model/pet_sub_type_entity.dart';
import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:chongmeng/function/main/community/dynamic_component/model/dynamic_liked_entity.dart';
import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
import 'package:chongmeng/function/integral/model/total_integral_entity.dart';
import 'package:chongmeng/function/integral/model/integral_record_entity.dart';
import 'package:chongmeng/helper/model/auto_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "OutermostEntity") {
      return OutermostEntity.fromJson(json) as T;
    } else if (T.toString() == "CosEntity") {
      return CosEntity.fromJson(json) as T;
    } else if (T.toString() == "ShippingAddressEntity") {
      return ShippingAddressEntity.fromJson(json) as T;
    } else if (T.toString() == "LoginEntity") {
      return LoginEntity.fromJson(json) as T;
    } else if (T.toString() == "RecipeEntity") {
      return RecipeEntity.fromJson(json) as T;
    } else if (T.toString() == "MyOrderEntity") {
      return MyOrderEntity.fromJson(json) as T;
    } else if (T.toString() == "SearchResultEntity") {
      return SearchResultEntity.fromJson(json) as T;
    } else if (T.toString() == "CurrentUserTallyEntity") {
      return CurrentUserTallyEntity.fromJson(json) as T;
    } else if (T.toString() == "TallyTagEntity") {
      return TallyTagEntity.fromJson(json) as T;
    } else if (T.toString() == "SignInResultEntity") {
      return SignInResultEntity.fromJson(json) as T;
    } else if (T.toString() == "SignListEntity") {
      return SignListEntity.fromJson(json) as T;
    } else if (T.toString() == "PetTypeEntity") {
      return PetTypeEntity.fromJson(json) as T;
    } else if (T.toString() == "PetSubTypeEntity") {
      return PetSubTypeEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeEntity") {
      return HomeEntity.fromJson(json) as T;
    } else if (T.toString() == "DynamicListEntity") {
      return DynamicListEntity.fromJson(json) as T;
    } else if (T.toString() == "DynamicLikedEntity") {
      return DynamicLikedEntity.fromJson(json) as T;
    } else if (T.toString() == "IntegralCommodityEntity") {
      return IntegralCommodityEntity.fromJson(json) as T;
    } else if (T.toString() == "TotalIntegralEntity") {
      return TotalIntegralEntity.fromJson(json) as T;
    } else if (T.toString() == "IntegralRecordEntity") {
      return IntegralRecordEntity.fromJson(json) as T;
    } else if (T.toString() == "AutoEntity") {
      return AutoEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}