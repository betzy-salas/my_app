import 'package:flutter/material.dart';

class ScaffoldAtom extends StatelessWidget {
  final body;
  final bottomNavigationBar;
  final scaffoldProperties;

  const ScaffoldAtom(
      {Key key, this.body, this.bottomNavigationBar, this.scaffoldProperties})
      : super(key: key);

  @override
  Widget build(BuildContext context) => new Scaffold(
        body: this.body,
        bottomNavigationBar: this.bottomNavigationBar,
        backgroundColor: this.scaffoldProperties,
      );
}
