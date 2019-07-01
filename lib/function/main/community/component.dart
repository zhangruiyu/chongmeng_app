import 'package:fish_redux/fish_redux.dart';

import 'adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommunityComponent extends Component<CommunityState> {
  CommunityComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<CommunityState>(
              adapter: CommunityItemAdapter(),
              slots: <String, Dependent<CommunityState>>{}),
        );

  @override
  ComponentState<CommunityState> createState() {
    return CommunityPageState();
  }

  static const DynamicTypePic = 0;
  static const DynamicTypeVideo = 1;
}
