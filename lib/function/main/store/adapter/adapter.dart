import 'package:chongmeng/function/main/store/integral_component/component.dart';
import 'package:chongmeng/function/main/store/integral_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class IntegralStoreAdapter extends DynamicFlowAdapter<IntegralStoreState> {
  IntegralStoreAdapter()
      : super(
          pool: <String, Component<Object>>{
            'integral': IntegralItemComponent()
          },
          connector: _IntegralStoreConnector(),
          reducer: buildReducer(),
        );
}

class _IntegralStoreConnector
    extends ConnOp<IntegralStoreState, List<ItemBean>> {
  @override
  List<ItemBean> get(IntegralStoreState state) {
    return <ItemBean>[
      ItemBean("integral", IntegralItemState(index: 0)),
      ItemBean("integral", IntegralItemState(index: 2)),
      ItemBean("integral", IntegralItemState(index: 1)),
      ItemBean("integral", IntegralItemState(index: 3)),
      ItemBean("integral", IntegralItemState(index: 4)),
      ItemBean("integral", IntegralItemState(index: 5)),
      ItemBean("integral", IntegralItemState(index: 6)),
      ItemBean("integral", IntegralItemState(index: 7)),
      ItemBean("integral", IntegralItemState(index: 8)),
      ItemBean("integral", IntegralItemState(index: 9)),
      ItemBean("integral", IntegralItemState(index: 10)),
      ItemBean("integral", IntegralItemState(index: 11)),
      ItemBean("integral", IntegralItemState(index: 12)),
      ItemBean("integral", IntegralItemState(index: 13)),
      ItemBean("integral", IntegralItemState(index: 14)),
      ItemBean("integral", IntegralItemState(index: 15)),
      ItemBean("integral", IntegralItemState(index: 16)),
      ItemBean("integral", IntegralItemState(index: 17)),
      ItemBean("integral", IntegralItemState(index: 18)),
      ItemBean("integral", IntegralItemState(index: 19)),
      ItemBean("integral", IntegralItemState(index: 20)),
      ItemBean("integral", IntegralItemState(index: 21)),
    ];
  }

  @override
  void set(IntegralStoreState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
