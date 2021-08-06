import 'package:flutter/material.dart';
import 'package:flutter_app/components/organisms/organism_appBar.dart';

class AppBarTemplate extends StatelessWidget {
  final children;

  AppBarTemplate({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBarOrganism(
      children: this.children,
    );
  }
}
