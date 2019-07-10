import 'package:flutter/material.dart' hide Action;

class VerticalLine extends StatelessWidget {
  final Color dividerColor;
  final double height;

  VerticalLine({this.dividerColor, this.height});

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    return Container(
      width: double.infinity,
      color: dividerColor ?? of.dividerColor,
      height: height ?? 0.5,
    );
  }
}
