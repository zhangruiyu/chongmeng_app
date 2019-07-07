import 'package:chongmeng/utils/date_utils.dart';
import 'package:fish_redux/fish_redux.dart';

enum AddTallyAction { SetDate, SetChipCheck, AddTally }

class AddTallyActionCreator {
  static Action onSetChipCheck(int id) {
    return Action(AddTallyAction.SetChipCheck, payload: id);
  }

  static Action onSetDate(DateTime dateTime) {
    return Action(AddTallyAction.SetDate,
        payload: DateUtils.formatData(dateTime));
  }

  static Action onAddTally() {
    return Action(AddTallyAction.AddTally);
  }
}
