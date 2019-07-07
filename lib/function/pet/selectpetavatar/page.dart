import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SelectPetAvatarPage extends Page<SelectPetAvatarState, Map<String, dynamic>> {
  SelectPetAvatarPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SelectPetAvatarState>(
                adapter: null,
                slots: <String, Dependent<SelectPetAvatarState>>{
                }),
            middleware: <Middleware<SelectPetAvatarState>>[
            ],);

}
