import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class DynamicDetailsState implements Cloneable<DynamicDetailsState> {
  DynamicListData data;

  @override
  DynamicDetailsState clone() {
    return DynamicDetailsState()..data = data;
  }
}

DynamicDetailsState initState(Map<String, dynamic> args) {
  return DynamicDetailsState()..data = args['data'];
}
