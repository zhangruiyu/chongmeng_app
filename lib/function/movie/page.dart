import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MoviePage extends Page<MovieState, Map<String, dynamic>> {
  MoviePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MovieState>(
                adapter: null,
                slots: <String, Dependent<MovieState>>{
                }),
            middleware: <Middleware<MovieState>>[
            ],);

}
