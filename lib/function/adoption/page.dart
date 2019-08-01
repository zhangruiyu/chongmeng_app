import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AdoptionPage extends Page<AdoptionState, Map<String, dynamic>> {
  AdoptionPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AdoptionState>(
                adapter: null,
                slots: <String, Dependent<AdoptionState>>{
                }),
            middleware: <Middleware<AdoptionState>>[
            ],);

}
