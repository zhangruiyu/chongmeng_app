import 'package:chongmeng/function/movie/movie_seat/model/seat_entity.dart';
import 'package:fish_redux/fish_redux.dart';

enum MovieSeatAction { SelectSeat, SetSeatData }

class MovieSeatActionCreator {
  static Action onSelectSeat(SeatSeatdataSeatRegionsRowsSeat itemRow) {
    return Action(MovieSeatAction.SelectSeat, payload: itemRow);
  }

  static Action onSetSeatData(p) {
    return Action(MovieSeatAction.SetSeatData, payload: p);
  }
}
