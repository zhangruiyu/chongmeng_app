import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';
import 'package:camera/camera.dart';

Effect<RecordState> buildEffect() {
  return combineEffects(<Object, Effect<RecordState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
  });
}

void _dispose(Action action, Context<RecordState> ctx) {
  ctx.state?.controller?.dispose();
}

void _initState(Action action, Context<RecordState> ctx) {
  ctx.state.controller =
      CameraController(ctx.state.cameras[0], ResolutionPreset.high);
//  ctx.state.controller.description  = ctx.state.cameras[0];
  ctx.state.controller.initialize().then((_) {
    if (ctx.isDisposed) {
      return;
    }
    ctx.dispatch(RecordActionCreator.onRefreshPage());
  });
}
