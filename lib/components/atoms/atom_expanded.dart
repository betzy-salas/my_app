import 'package:flutter/material.dart';

class ExpandedAtom extends StatelessWidget {
  final child;

  const ExpandedAtom({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => new Expanded(
        child: this.child,
      );
}
