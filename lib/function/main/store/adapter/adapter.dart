import 'package:chongmeng/function/main/store/integarl_component/component.dart';
import 'package:chongmeng/function/main/store/integarl_component/state.dart';
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
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
      ItemBean("integral", IntegralItemState()),
    ];
  }

  @override
  void set(IntegralStoreState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
