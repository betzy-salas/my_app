import 'package:flutter/material.dart';

class SafeAreaAtom extends StatelessWidget {
  final child;

  const SafeAreaAtom({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => new SafeArea(
        child: child,
      );
}
