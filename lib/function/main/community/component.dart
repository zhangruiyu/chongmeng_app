import 'package:fish_redux/fish_redux.dart';

import 'adapter/adapter.dart';
import 'effect.dart';
import 'item_body/component.dart';
import 'item_body/state.dart';
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
              slots: <String, Dependent<CommunityState>>{
                CommunityState.NewType:
                    communityBodyConnector(CommunityState.NewType) +
                        ItemBodyComponent(),
                CommunityState.VideoType:
                    communityBodyConnector(CommunityState.VideoType) +
                        ItemBodyComponent()
              },
              adapter: null),
        );

  @override
  ComponentState<CommunityState> createState() {
    return CommunityPageState();
  }

  static const DynamicTypePic = 0;
  static const DynamicTypeVideo = 1;
  static const DynamicTypeText = 2;
}
