import 'package:flutter/material.dart';

class IconAtom extends StatelessWidget {
  final icon;
  final color;

  const IconAtom({Key key, this.icon, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) => new Icon(this.icon, color: this.color);
}
