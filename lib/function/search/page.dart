import 'package:fish_redux/fish_redux.dart';

import 'adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchPage extends Page<SearchState, Map<String, dynamic>> {
  SearchPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SearchState>(
              adapter: SearchListConnector() + SearchListAdapter(),
              slots: <String, Dependent<SearchState>>{}),
          middleware: <Middleware<SearchState>>[],
        );
}
