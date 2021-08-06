import 'package:flutter/material.dart';
import 'package:flutter_app/components/atoms/atom_listView.dart';

class ListViewTemplate extends StatelessWidget {
  final padding;
  final radius;
  final listData;
  final builder;

  ListViewTemplate(
      {Key key, this.padding, this.radius, this.listData, this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListViewAtom(
      length: this.listData.length,
      builder: this.builder,
      padding: this.padding,
    );
  }
}
