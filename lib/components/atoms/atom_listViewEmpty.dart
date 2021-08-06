import 'package:flutter/material.dart';

class ListViewEmptyAtom extends StatelessWidget {
  final padding;
  final children;

  const ListViewEmptyAtom({Key key, this.padding, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) => new ListView(
        padding: this.padding,
        children: this.children,
      );
}
