import 'package:chongmeng/function/main/community/details/reply_component/component.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class ReplyListAdapter extends DynamicFlowAdapter<ReplyListState> {
  ReplyListAdapter()
      : super(
          pool: <String, Component<Object>>{'reply': ReplyComponent()},
          connector: _ReplyListConnector(),
          reducer: buildReducer(),
        );
}

class _ReplyListConnector extends ConnOp<ReplyListState, List<ItemBean>> {
  @override
  List<ItemBean> get(ReplyListState state) {
    return <ItemBean>[
      ItemBean('reply', null),
      ItemBean('reply', null),
      ItemBean('reply', null),
      ItemBean('reply', null),
      ItemBean('reply', null),
      ItemBean('reply', null),
      ItemBean('reply', null)
    ];
  }

  @override
  void set(ReplyListState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
