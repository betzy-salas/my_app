import 'package:flutter/material.dart';
import 'package:flutter_app/components/organisms/organism_card_column.dart';

class OptionsBuildDataTemplate extends StatelessWidget {
  OptionsBuildDataTemplate(
      {Key key,
      this.cardProperties,
      this.shapeProperties,
      this.listChildren,
      this.columnProperties})
      : super(key: key);

  final cardProperties;
  final shapeProperties;
  final listChildren;
  final columnProperties;

  @override
  Widget build(BuildContext context) {
    return CardColumOrganism(
      cardProperties: this.cardProperties,
      shapeProperties: shapeProperties,
      children: listChildren,
      columnProperties: columnProperties,
    );
  }
}
