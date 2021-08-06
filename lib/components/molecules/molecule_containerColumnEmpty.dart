import 'package:flutter/material.dart';
import 'package:flutter_app/components/atoms/atom_column_empty.dart';
import 'package:flutter_app/components/atoms/atom_container_empty.dart';

class ContainerColumnEmptyMolecule extends StatelessWidget {
  final children;

  ContainerColumnEmptyMolecule({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerEmptyAtom(child: ColumnEmptyAtom(children: this.children));
  }
}
