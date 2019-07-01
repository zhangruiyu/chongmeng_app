import 'package:chongmeng/function/main/community/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class CommunityItemAdapter extends DynamicFlowAdapter<CommunityState> {
  CommunityItemAdapter()
      : super(
          pool: <String, Component<Object>>{},
          connector: _CommunityItemConnector(),
          reducer: buildReducer(),
        );
}

class _CommunityItemConnector extends ConnOp<CommunityState, List<ItemBean>> {
  @override
  List<ItemBean> get(CommunityState state) {
    return <ItemBean>[];
  }

  @override
  void set(CommunityState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
