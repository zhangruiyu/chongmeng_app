import 'package:fish_redux/fish_redux.dart';

import 'adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DynamicDetailsPage
    extends Page<DynamicDetailsState, Map<String, dynamic>> {
  DynamicDetailsPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<DynamicDetailsState>(
              adapter: ReplyListConnector() + ReplyListAdapter(),
              slots: <String, Dependent<DynamicDetailsState>>{}),
          middleware: <Middleware<DynamicDetailsState>>[],
        );
}
