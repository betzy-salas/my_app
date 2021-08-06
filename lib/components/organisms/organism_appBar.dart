import 'package:flutter/material.dart';
import 'package:flutter_app/components/molecules/molecule_ContainerRow.dart';

class AppBarOrganism extends StatelessWidget {
  final children;
  final alignment;
  final mainAxisAlignment;

  AppBarOrganism(
      {Key key, this.children, this.alignment, this.mainAxisAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerRowMolecule(
      alignment: this.alignment,
      mainAxisAlignment: this.mainAxisAlignment,
      children: this.children,
    );
  }
}
