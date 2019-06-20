import 'package:chongmeng/network/outermost_entity.dart';
import 'package:chongmeng/helper/model/auto_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "OutermostEntity") {
      return OutermostEntity.fromJson(json) as T;
    } else if (T.toString() == "AutoEntity") {
      return AutoEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}