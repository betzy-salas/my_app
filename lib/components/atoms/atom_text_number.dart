import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui';

class SimpleTextNumberAtom extends StatelessWidget {
  final text;
  final align;
  final size;
  final weight;
  final family;
  final style;
  final colors;

  SimpleTextNumberAtom(
      {Key key,
      this.text,
      this.align,
      this.size,
      this.weight,
      this.family,
      this.style,
      this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.simpleCurrency();
    return new Text('${formatCurrency.format(this.text)}',
        style: TextStyle(
            fontStyle: this.style,
            fontSize: this.size,
            fontWeight: this.weight,
            fontFamily: this.family,
            color: this.colors),
        textAlign: this.align);
  }
}
