import 'package:flutter/material.dart';
import 'package:flutter_app/components/atoms/atom_card.dart';
import 'package:flutter_app/components/atoms/atom_column.dart';

class CardColumnMolecule extends StatelessWidget {
  final cardProperties;
  final shapeProperties;
  final children;
  final columnProperties;

  CardColumnMolecule(
      {Key key,
      this.cardProperties,
      this.shapeProperties,
      this.children,
      this.columnProperties})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardAtom(
        cardProperties: this.cardProperties,
        shapeProperties: this.shapeProperties,
        child: ColumAtom(
          children: this.children,
          columnProperties: this.columnProperties,
        ));
  }
}
