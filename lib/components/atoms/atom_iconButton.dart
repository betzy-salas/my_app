import 'package:flutter/material.dart';

class IconButtonAtom extends StatelessWidget {
  final layoutOptionMenu;
  final tooltip;
  final onPressed;

  const IconButtonAtom(
      {Key key, this.layoutOptionMenu, this.tooltip, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => new IconButton(
      icon: Icon(layoutOptionMenu), tooltip: tooltip, onPressed: onPressed);
}
