import 'package:flutter/material.dart';
import 'package:flutter_app/components/atoms/atom_iconButton.dart';
import 'package:flutter_app/components/atoms/atom_text.dart';
import 'package:flutter_app/components/constants/constants_color.dart';
import 'package:flutter_app/components/constants/constants_maps.dart';
import 'package:flutter_app/components/constants/constants_number.dart';
import 'package:flutter_app/components/constants/constants_text.dart';
import 'package:flutter_app/components/molecules/molecule_ContainerRow.dart';
import 'package:flutter_app/components/objects/CardPropertiesPage.dart';
import 'package:flutter_app/components/objects/ColumPropertiesPage.dart';
import 'package:flutter_app/components/templates/template_options_data.dart';

class OptionsPage extends StatefulWidget {
  OptionsPage({Key key}) : super(key: key);

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //return _cardDataOptions();
    return _cardOptions();
  }

  Container _cardOptions() {
    return Container(
      height: 200,
      width: 500,
      child: _buildCard(),
    );
  }

  OptionsBuildDataTemplate _buildCard() {
    return OptionsBuildDataTemplate(
      cardProperties: _cardColumPage(),
      shapeProperties: _shapeProperties(RADIUS_OPTIONS),
      listChildren: _listChildren(
          LayoutOptionMenu.nequi,
          LayoutOptionMenu.giros,
          LayoutOptionMenu.pagos,
          LayoutOptionMenu.consignaciones,
          LayoutOptionMenu.recaudos,
          LayoutOptionMenu.tarjeta),
      columnProperties: _columnPropertiesPage(),
    );
  }

  CardPropertiesPage _cardColumPage() {
    CardPropertiesPage cardColumPageModel = new CardPropertiesPage(
        true,
        Clip.antiAliasWithSaveLayer,
        ELEVATION_CARD,
        EdgeInsets.all(MARGIN_CARD));

    return cardColumPageModel;
  }

  ColumnPropertiesPage _columnPropertiesPage() {
    ColumnPropertiesPage columnPropertiesPage =
        new ColumnPropertiesPage(CrossAxisAlignment.start, MainAxisSize.min);

    return columnPropertiesPage;
  }

  RoundedRectangleBorder _shapeProperties(double radius) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    );
  }

  ContainerRowMolecule _textDataOptions(LayoutOptionMenu optionOne,
      LayoutOptionMenu optionTwo, LayoutOptionMenu optionThree) {
    return ContainerRowMolecule(
        alignment: Alignment.topRight,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _listChildrenText(optionOne, optionTwo, optionThree));
  }

  ContainerRowMolecule _textDataIcon(LayoutOptionMenu optionOne,
      LayoutOptionMenu optionTwo, LayoutOptionMenu optionThree) {
    return ContainerRowMolecule(
        alignment: Alignment.topRight,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _listChildrenIcon(optionOne, optionTwo, optionThree));
  }

  List<Widget> _listChildrenIcon(LayoutOptionMenu optionOne,
      LayoutOptionMenu optionTwo, LayoutOptionMenu optionThree) {
    List<Widget> listChildren = [];
    listChildren.add(IconButtonAtom(
      layoutOptionMenu: iconData[optionOne],
      tooltip: layoutOptionsMenu[optionOne],
      onPressed: () {},
    ));
    listChildren.add(IconButtonAtom(
      layoutOptionMenu: iconData[optionTwo],
      tooltip: layoutOptionsMenu[optionTwo],
      onPressed: () {},
    ));
    listChildren.add(IconButtonAtom(
      layoutOptionMenu: iconData[optionThree],
      tooltip: layoutOptionsMenu[optionThree],
      onPressed: () {},
    ));
    return listChildren;
  }

  List<Widget> _listChildren(
      LayoutOptionMenu optionOne,
      LayoutOptionMenu optionTwo,
      LayoutOptionMenu optionThree,
      LayoutOptionMenu optionFour,
      LayoutOptionMenu optionFive,
      LayoutOptionMenu optionSix) {
    List<Widget> listChildren = [];
    listChildren.add(_textDataIcon(optionOne, optionTwo, optionThree));
    listChildren.add(_textDataOptions(optionOne, optionTwo, optionThree));
    listChildren.add(_textDataIcon(optionFour, optionFive, optionSix));
    listChildren.add(_textDataOptions(optionFour, optionFive, optionSix));
    return listChildren;
  }

  List<Widget> _listChildrenText(LayoutOptionMenu optionOne,
      LayoutOptionMenu optionTwo, LayoutOptionMenu optionThree) {
    List<Widget> listChildren = [];
    listChildren.add(SimpleTextAtom(
        align: TextAlign.center,
        text: layoutOptionsMenu[optionOne],
        size: SIZE_SIMPLE_TEXT,
        weight: FontWeight.normal,
        family: TEXT_FONT_FAMILY,
        style: FontStyle.normal,
        colors: colorSimpleTextBlack));
    listChildren.add(SimpleTextAtom(
        align: TextAlign.center,
        text: layoutOptionsMenu[optionTwo],
        size: SIZE_SIMPLE_TEXT,
        weight: FontWeight.normal,
        family: TEXT_FONT_FAMILY,
        style: FontStyle.normal,
        colors: colorSimpleTextBlack));
    listChildren.add(SimpleTextAtom(
        align: TextAlign.center,
        text: layoutOptionsMenu[optionThree],
        size: SIZE_SIMPLE_TEXT,
        weight: FontWeight.normal,
        family: TEXT_FONT_FAMILY,
        style: FontStyle.normal,
        colors: colorSimpleTextBlack));
    return listChildren;
  }
}
