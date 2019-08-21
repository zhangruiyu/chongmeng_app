import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UserDetailsPage extends Page<UserDetailsState, Map<String, dynamic>> {
  UserDetailsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<UserDetailsState>(
                adapter: null,
                slots: <String, Dependent<UserDetailsState>>{
                }),
            middleware: <Middleware<UserDetailsState>>[
            ],);

}
