import 'package:fish_redux/fish_redux.dart';

import 'account/component.dart';
import 'effect.dart';
import 'home/component.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MainPage extends Page<MainState, Map<String, dynamic>> {
  MainPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MainState>(
              adapter: null,
              slots: <String, Dependent<MainState>>{
                'home': homeConnector() + HomeComponent(),
                'account': accountConnector() + AccountComponent()
              }),
          middleware: <Middleware<MainState>>[],
        );
}
