import 'package:flutter/material.dart';
import 'package:flutter_app/components/atoms/atom_text.dart';
import 'package:flutter_app/components/constants/constants_color.dart';
import 'package:flutter_app/components/constants/constants_number.dart';
import 'package:flutter_app/components/constants/constants_text.dart';
import 'package:flutter_app/components/organisms/organism_appBar.dart';

class AppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBarOrganism(
      children: _listChildren(),
      alignment: Alignment.bottomCenter,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  List<Widget> _listChildren() {
    List<Widget> _listChildren = [];

    _listChildren.add(SimpleTextAtom(
        align: TextAlign.center,
        text: TEXT_LABEL_TITLE_CB,
        size: SIZE_LABEL_TITTLE_TEXT,
        weight: FontWeight.normal,
        family: TEXT_FONT_FAMILY,
        style: FontStyle.normal,
        colors: colorSimpleTextBlack));
    _listChildren.add(Image.asset(
      URL_IMAGE_APP_BAR,
      width: 50,
    ));

    return _listChildren;
  }
}
