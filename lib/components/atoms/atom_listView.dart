import 'package:flutter/material.dart';

class ListViewAtom extends StatelessWidget {
  final length;
  final builder;
  final padding;

  const ListViewAtom({Key key, this.length, this.builder, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) => new ListView.builder(
        itemCount: this.length,
        itemBuilder: this.builder,
        padding: this.padding,
      );
}
