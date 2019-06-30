import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UploadImagePage extends Page<UploadImageState, Map<String, dynamic>> {
  UploadImagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<UploadImageState>(
                adapter: null,
                slots: <String, Dependent<UploadImageState>>{
                }),
            middleware: <Middleware<UploadImageState>>[
            ],);

}
