import 'package:flutter/material.dart';
import 'package:flutter_app/components/atoms/atom_center.dart';
import 'package:flutter_app/components/atoms/atom_circularProgressIndicator.dart';

class CircularProgressMolecule extends StatelessWidget {
  CircularProgressMolecule({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenterAtom(child: CircularProgressIndicatorAtom());
  }
}
