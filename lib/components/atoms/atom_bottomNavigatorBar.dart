import 'package:flutter/material.dart';

class BottomNavigatorBarAtom extends StatelessWidget {
  final type;
  final items;
  final onTap;

  const BottomNavigatorBarAtom({Key key, this.type, this.items, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => new BottomNavigationBar(
        type: type,
        items: items,
        onTap: onTap,
      );
}
