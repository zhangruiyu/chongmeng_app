import 'package:fish_redux/fish_redux.dart';
import 'package:overlay_support/overlay_support.dart';
import 'action.dart';
import 'state.dart';
import 'package:camera/camera.dart';

Effect<RecordState> buildEffect() {
  return combineEffects(<Object, Effect<RecordState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    RecordAction.CameraSwitched: _onCameraSwitched,
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

Future _onCameraSwitched(Action action, Context<RecordState> ctx) async {
  CameraDescription cameraDescription;
  if (ctx.state.controller.description == ctx.state.cameras[0]) {
    cameraDescription = ctx.state.cameras[1];
  } else {
    cameraDescription = ctx.state.cameras[0];
  }

  if (ctx.state.controller != null) {
    await ctx.state.controller.dispose();
  }

  ctx.state.controller =
      CameraController(cameraDescription, ResolutionPreset.high);

  // If the controller is updated then update the UI.
  ctx.state.controller.addListener(() {
    if (!ctx.isDisposed) {
      ctx.dispatch(RecordActionCreator.onRefreshPage());
    }

    if (ctx.state.controller.value.hasError) {
      toast(ctx.context,
          'Camera error ${ctx.state.controller.value.errorDescription}');
    }
  });

  try {
    await ctx.state.controller.initialize();
  } on CameraException catch (e) {
    toast(ctx.context, 'Camera error $e');
  }

  if (!ctx.isDisposed) {
    ctx.dispatch(RecordActionCreator.onRefreshPage());
  }
}
