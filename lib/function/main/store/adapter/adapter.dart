import 'package:chongmeng/function/main/store/integral_component/component.dart';
import 'package:chongmeng/function/main/store/integral_component/state.dart';
import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
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
    if (state.integralCommodityData?.isNotEmpty == true) {
      return state.integralCommodityData
          .map<ItemBean>((IntegralCommodityData item) => ItemBean(
              "integral",
              IntegralItemState(
                  index: state.integralCommodityData.indexOf(item),
                  itemData: item)))
          .toList();
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(IntegralStoreState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
