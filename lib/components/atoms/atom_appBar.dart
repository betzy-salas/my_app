import 'package:flutter/material.dart';

class AppBarAtom extends StatelessWidget {
  final child;

  const AppBarAtom({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => new AppBar(
        title: this.child,
      );
}
