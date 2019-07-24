import 'package:flutter/material.dart';

class IndexInherited extends InheritedWidget {
  const IndexInherited({
    Key key,
    @required this.index,
    @required Widget child,
  })  : assert(index != null),
        assert(child != null),
        super(key: key, child: child);

  final String index;

  static IndexInherited of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(IndexInherited);
  }

  @override
  bool updateShouldNotify(IndexInherited old) => index != old.index;
}
