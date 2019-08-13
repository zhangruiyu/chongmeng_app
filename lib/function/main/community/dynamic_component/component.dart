import 'package:chongmeng/components/community_user_head/component.dart';
import 'package:chongmeng/components/community_user_head/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DynamicItemComponent extends Component<DynamicItemState> {
  DynamicItemComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<DynamicItemState>(
              adapter: null,
              slots: <String, Dependent<DynamicItemState>>{
                'community_user_head':
                    CommunityUserHeadConnector() + CommunityUserHeadComponent()
              }),
        );
}
