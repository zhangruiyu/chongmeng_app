import 'package:flutter/material.dart' hide Action;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: Container(
        width: 50.0,
        height: 50.0,
        child: SpinKitFadingCube(
          color: Theme.of(context).primaryColor,
          size: 25.0,
        ),
      ),
    );
  }
}
