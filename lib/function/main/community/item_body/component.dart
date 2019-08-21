import 'package:chongmeng/function/main/community/adapter/adapter.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ItemBodyComponent extends Component<ItemBodyState> {
  ItemBodyComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ItemBodyState>(
              adapter: NoneConn<ItemBodyState>() + DynamicListAdapter(),
              slots: <String, Dependent<ItemBodyState>>{}),
        );
}
