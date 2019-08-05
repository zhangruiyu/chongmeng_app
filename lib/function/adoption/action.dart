import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:fish_redux/fish_redux.dart';

import 'model/adoption_entity.dart';

enum AdoptionAction { ResetData, Refresh }

class AdoptionActionCreator {
  static Action onRefresh(Map<String, dynamic> map) {
    return Action(AdoptionAction.Refresh, payload: map);
  }

  static Action onResetData(List<AdoptionData> data) {
    return Action(AdoptionAction.ResetData, payload: data);
  }
}
