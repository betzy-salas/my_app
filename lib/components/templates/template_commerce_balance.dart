import 'package:flutter/material.dart';
import 'package:flutter_app/components/organisms/organism_card_column.dart';

class CommerceBuildBalanceTemplate extends StatelessWidget {
  final cardProperties;
  final columnProperties;
  final shapeProperties;
  final children;

  CommerceBuildBalanceTemplate(
      {Key key,
      this.cardProperties,
      this.columnProperties,
      this.shapeProperties,
      this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardColumOrganism(
      cardProperties: this.cardProperties,
      shapeProperties: this.shapeProperties,
      children: this.children,
      columnProperties: this.columnProperties,
    );
  }
}
