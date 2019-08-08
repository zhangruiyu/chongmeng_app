import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DynamicDetailsPage extends Page<DynamicDetailsState, Map<String, dynamic>> {
  DynamicDetailsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DynamicDetailsState>(
                adapter: null,
                slots: <String, Dependent<DynamicDetailsState>>{
                }),
            middleware: <Middleware<DynamicDetailsState>>[
            ],);

}
