import 'package:chongmeng/function/adoption/model/adoption_entity.dart';
import 'package:chongmeng/function/adoption/my_adoption/model/my_adoption_entity.dart';
import 'package:fish_redux/fish_redux.dart';

enum MyAdoptionAction { ResetData, Refresh, ShowAdoptionState }

class MyAdoptionActionCreator {
  static Action onRefresh(params) {
    return Action(MyAdoptionAction.Refresh, payload: params);
  }

  static Action onResetData(data) {
    return Action(MyAdoptionAction.ResetData, payload: data);
  }

  static Action onShowAdoptionState(MyAdoptionDataAdoption adoption) {
    return Action(MyAdoptionAction.ShowAdoptionState, payload: adoption);
  }
}
