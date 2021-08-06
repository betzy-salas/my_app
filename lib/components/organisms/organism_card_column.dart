import 'package:flutter/material.dart';
import 'package:flutter_app/components/molecules/molecule_cardColumn.dart';

class CardColumOrganism extends StatelessWidget {
  final cardProperties;
  final shapeProperties;
  final children;
  final columnProperties;

  CardColumOrganism(
      {Key key,
      this.cardProperties,
      this.shapeProperties,
      this.children,
      this.columnProperties})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardColumnMolecule(
      cardProperties: this.cardProperties,
      shapeProperties: this.shapeProperties,
      children: this.children,
      columnProperties: columnProperties,
    );
  }
}
