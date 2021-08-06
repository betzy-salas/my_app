import 'package:flutter/material.dart';
import 'package:flutter_app/components/organisms/organism_card_column.dart';

class CommerceBuildDataTemplate extends StatelessWidget {
  final cardProperties;
  final columnProperties;
  final shapeProperties;
  final listChildren;

  CommerceBuildDataTemplate(
      {Key key,
      this.cardProperties,
      this.columnProperties,
      this.shapeProperties,
      this.listChildren})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardColumOrganism(
      cardProperties: this.cardProperties,
      shapeProperties: this.shapeProperties,
      children: this.listChildren,
      columnProperties: this.columnProperties,
    );
  }
}
