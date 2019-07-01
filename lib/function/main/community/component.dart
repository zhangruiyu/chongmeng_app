import 'package:fish_redux/fish_redux.dart';

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
              adapter: null, slots: <String, Dependent<CommunityState>>{}),
        );
  static const DynamicTypePic = 0;
  static const DynamicTypeVideo = 1;
}
